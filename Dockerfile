FROM python:3.12 AS cli
LABEL maintainer="Javier"

RUN curl -sSL https://install.python-poetry.org | python3 -

FROM python:3.12-slim AS deploy

COPY --from=cli /root/.local/ /root/.local/
ENV PATH="${PATH}:/root/.local/bin"

WORKDIR /code
COPY poetry.lock ./
COPY pyproject.toml ./
COPY README.md ./

RUN poetry -V
RUN poetry install -v --no-root

COPY src ./src

RUN poetry install -v

CMD ["poetry","run","python", "./src/cicd/ui/app.py"]
