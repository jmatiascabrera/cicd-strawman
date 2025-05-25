from cicd.strawman.main import add


def test_add():
    # ARRANGE

    a = 5
    b = 3

    # ACT
    result = add(a, b)

    # ASSERT
    assert result == 8, f"Expected 8, but got {result}"
