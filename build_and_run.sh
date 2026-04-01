#!/bin/bash

# Always run from the folder this script lives in
cd "$(dirname "$0")"

# scipt to compile and run a C++ file
CPP_FILE="test.cpp"
OUTPUT_FILE="test.exe"
LOG_DIR="logs"

# timestamp for log file
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
LOG_FILE="$LOG_DIR/log_$TIMESTAMP.txt"

# setup
mkdir -p $LOG_DIR
echo "Build started at $TIMESTAMP" > $LOG_FILE
echo "Compiling $CPP_FILE..." | tee -a $LOG_FILE

if [ $? -eq 0 ]; then
    echo "Compilation successful" | tee -a $LOG_FILE
else
    echo "Compilation failed" | tee -a $LOG_FILE
    exit 1
fi

# run
echo "Running program..." | tee -a $LOG_FILE
echo "Program Output:" | tee -a $LOG_FILE
./$OUTPUT_FILE | tee -a $LOG_FILE

echo "Done" | tee -a $LOG_FILE
echo "Log saved to: $LOG_FILE"

# chmod +x build_and_run.sh