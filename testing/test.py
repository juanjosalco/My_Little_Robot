import subprocess
from time import sleep

def main():
    # Define the input instructions as a list of strings
    input_instructions_list = [
        "Robot please move 3 units to the left",
        "Robot please move 1 units to the right, then move one unit forward",
    ]

    # Define the expected output as a list of strings
    expected_output_list = [
    """ 
    !--------------- Welcome to MyLittleRobot ---------------!

    O O O O O O O O O O 
    O O O O O O O O O O 
    O O O O O O O O O O 
    O O O O O O O O O O 
    O O O O O O O O O O 
    O O O O O X O O O O 
    O O O O O O O O O O 
    O O O O O O O O O O 
    O O O O O O O O O O 
    O O O O O O O O O O 

    Robot has finished the instructions

    O O O O O O O O O O 
    O O O O O O O O O O 
    O O O O O * O O O O 
    O O O O O * O O O O 
    O O O O O * O O O O 
    O O O O O * O O O O 
    O O O O O X O O O O 
    O O O O O O O O O O 
    O O O O O O O O O O 
    O O O O O O O O O O 
    """,
    """ 
    !--------------- Welcome to MyLittleRobot ---------------!

    O O O O O O O O O O 
    O O O O O O O O O O 
    O O O O O O O O O O 
    O O O O O O O O O O 
    O O O O O O O O O O 
    O O O O O X O O O O 
    O O O O O O O O O O 
    O O O O O O O O O O 
    O O O O O O O O O O 
    O O O O O O O O O O 

    Robot has finished the instructions

    O O O O O O O O O O 
    O O O O O O O O O O 
    O O O O O O O O O O 
    O O O O O O O O O O 
    O O O O O O O O O O 
    O O O O O * O O O O 
    O O O O O * O O O O 
    O O O O O X O O O O 
    O O O O O O O O O O 
    O O O O O O O O O O
    """

    ]

    # Write the input instructions to a file
    with open("../input.txt", "w") as f:
        for i, instructions in enumerate(input_instructions_list):
            f.write(instructions)
            # Compile the program using the Makefile
            compile = subprocess.Popen(["cd .. && make"], shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
            # Wait for the compilation to finish
            compile.wait()
            # Run the program with the input instructions and capture the output
            process = subprocess.Popen(["../cpu/src/main.exe"], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
            process.wait()
            with open("result.txt", "r") as output_file:
                stdout = output_file.read()
            if stdout == expected_output_list[i]:
                print(f"Test {i+1} passed")
            else:
                print(f"Test {i+1} failed")
                
            # Wait for 1 second before running the next test
            sleep(1)
        
if __name__ == "__main__":
    main()

        
        
       