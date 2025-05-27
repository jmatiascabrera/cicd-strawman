#!/usr/bin/env bash

#inspect_args

# check if ash is installed
if ! command -v ash &>/dev/null; then
  red_ln "ASH is not installed."
  exit 1
fi

set +euo pipefail

ash --build-target ci --output-dir .ash-results/ --source-dir .
ret_val=$?

if [ "$ret_val" -ne 0 ]; then
  cat .ash-results/aggregated_results.txt
  red_bold_ln "ASH scan failed."

  exit "$ret_val"
else
  green_ln "ASH scan completed successfully."
  white_bold_ln "ASH scan results saved to .ash-results/aggregated_results.txt"
fi
