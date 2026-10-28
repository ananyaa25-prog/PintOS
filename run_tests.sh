#!/bin/bash

ROOT="$HOME/pintos-project/pintos"
BUILD="$ROOT/src/threads/build"
OUT="$ROOT/validation"
export PATH="$ROOT/src/utils:$PATH"

TESTS=(
    priority-donate-chain
    priority-donate-one
    priority-donate-multiple
    priority-donate-nest
    priority-preempt
    priority-fifo
    priority-change
    priority-condvar
    alarm-single
    alarm-priority
    alarm-simultaneous
)

mkdir -p "$OUT/logs" "$OUT/csv"

echo "test,status" > "$OUT/csv/test_summary.csv"

cd "$BUILD" || exit 1

for test in "${TESTS[@]}"; do
    echo "Running $test ..."

    rm -f "tests/threads/$test.result"

    if make SIMULATOR=--qemu \
        "tests/threads/$test.result" \
        > "$OUT/logs/$test.log" 2>&1; then
        status="PASS"
    else
        status="FAIL"
    fi

    echo "$test,$status" >> "$OUT/csv/test_summary.csv"
    echo "$test: $status"
done

echo
echo "===== TEST SUMMARY ====="
cat "$OUT/csv/test_summary.csv"
