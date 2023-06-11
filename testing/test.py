import os
from time import sleep

def run(input_instructions_list, expected_output_list, tests):
    for i, instructions in enumerate(input_instructions_list):
        f = open("../input.txt", "w")
        f.write(instructions)
        f.close()
        # Compile and run the program
        os.system("cd .. && make compile")
        os.system("cd .. && make run-test")
        outputFile = open("result.txt", "r")
        output = outputFile.read()
        outputFile.close()
        output = output.replace("\n", "").replace(" ", "").replace("\t", "")
        expected_output_list[i] = expected_output_list[i].replace("\n", "").replace(" ", "").replace("\t", "")
        
        if output == expected_output_list[i]:
            tests.append(f"✅ Test {i+1}: PASS")
        else:
            tests.append(f"❌ Test {i+1}: FAIL")

def main():
    # Define the input instructions as a list of strings
    input_instructions_list = [
        "Robot please move 3 units to the left",
        "Robot please move 1 units to the right, then move 1 units forward",
        "Robot please turn 175 degrees",
        "Robot please go 3 units backwards, then move 1 units forward, next move 2 units to the right, finally move 1 blocks to the front",
        "Robot please move 8 units",
        "Robot please move 1 units, the jump 5 blocks left",
        "Robot move 2 turn backwards"
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
O O O O O X O O O O 
O O O O O * O O O O 
O O O O O * O O O O 
O O O O O * O O O O 
O O O O O O O O O O 
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

! INVALID INSTRUCTION !

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
O X O O O O O O O O 
O * O O O O O O O O 
O * O O O O O O O O 
O * * * * * O O O O 
O O O O O O O O O O 
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
! INVALID MOVE !

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

! INVALID INSTRUCTION !

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

! INVALID INSTRUCTION !

    """
    ]
    tests = []
    run(input_instructions_list, expected_output_list, tests)       
    os.system("clear")
    print("Test Results:")
    sleep(1.5)
    for test in tests:
        print(test)
        sleep(1.5)
    os.remove("result.txt")
        
if __name__ == "__main__":
    main()

        
        
       