# Pintos Scheduler Validation and Evaluation

## Objective
Validate selected Pintos thread scheduling and alarm behaviors
for the starvation-aware scheduling project.

## Test Automation
The script `run_tests.sh` runs a selected set of Pintos tests
using QEMU and saves an individual log for each test.

## Current Results
The current recorded run contains 11 selected tests.
All 11 passed in this run.

See `csv/test_summary.csv` for the recorded outcomes and
`logs/` for individual test-runner logs.

## Scope and Limitations
These results cover only the selected tests, not the complete
Pintos test suite. MLFQS testing and detailed per-thread
scheduling measurements require further validation.

Fairness metrics and graphs will be added after suitable
scheduling measurements have been collected.

## Reproduction
From the root of the Pintos project, run:

    ./validation/run_tests.sh
