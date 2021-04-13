#!/bin/bash
source long_performance/common.sh

WRITE_RATE_LIMIT=$((1024 * 1024 * 10))
DURATION=$((60 * 60))

DB_BENCH_PARAMS="--benchmarks=readwhilewriting --num=$NUM --value_size=$VALUE_SIZE --histogram --duration=$DURATION --benchmark_write_rate_limit=$WRITE_RATE_LIMIT $FS_PARAMS $DB_BENCH_EXTRA_PARAMS"

echo "# Running db_bench with parameters: $DB_BENCH_PARAMS" > $TEST_OUT
$TOOLS_DIR/db_bench $DB_BENCH_PARAMS >> $TEST_OUT

check_db_bench_workload_completion readwhilewriting
exit $?
