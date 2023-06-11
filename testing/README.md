# My Little Robot Test Automation
##### Authors:
- Armando Terrazas Gómez | A01640924
- Fernando Gómez Martínez | A01641228
- Juan José Salazar Cortés | A01642126
- Mariana Esquivel Hernández | A01641244

## Introduction
The file test contains a Python script for automating tests for the MyLittleRobot program. It allows you to define a set of input instructions and their expected outputs, and then runs the program with each input and compares the output to the expected result.

## Prerequisites

Make sure you have the following installed:

- Python (version 3 or above)
- `make` command (used for compilation)

## Instructions

1. Navigate to the repository directory.
2. Open the `test.py` file in a text editor.
3. Modify the `input_instructions_list` and `expected_output_list` variables according to your test cases.

## Running the Tests

To run the tests, follow these steps:

1. Open a terminal or command prompt.
2. Navigate to the repository directory.
3. Run the following command to execute the script:

   ```bash
   python3 test.py
   ```

4. The script will compile and run the program for each input instruction and compare the output to the expected result.
5. After all tests have been executed, the test results will be displayed in the terminal.

## Test Results

The test results will be shown in the terminal after running the script. Each test will be marked as either "PASS" or "FAIL" along with the corresponding test number.

Example test results:

```
Test Results:
✅ Test 1: PASS
✅ Test 2: PASS
❌ Test 3: FAIL
✅ Test 4: PASS
❌ Test 5: FAIL
✅ Test 6: PASS
✅ Test 7: PASS
```

## Cleanup

The script will automatically remove the `result.txt` file generated during the tests.

Please note that this script assumes the presence of a `makefile` in the parent directory for compilation and running the program. Make sure the makefile is properly configured for your program before running the tests.

Feel free to modify the script as needed for your specific testing requirements.
