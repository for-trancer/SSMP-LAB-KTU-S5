# 8086 MASM Assembly Programs Repository

Welcome to the 8086 MASM Assembly Programs repository! This collection contains a set of assembly language programs written for the 8086 architecture. You can execute these programs using DOSBox, a DOS emulator that allows you to run DOS programs on modern systems.

## Running Programs with DOSBox

Follow these steps to execute the 8086 MASM Assembly programs using DOSBox:

1. **Install DOSBox:**
   - Download and install DOSBox from [https://www.dosbox.com/](https://www.dosbox.com/).

2. **Clone the Repository:**
   - Clone this repository to your local machine using the following command:
     ```
     git clone https://github.com/fortrancer/SSMP-LAB-KTU-S5.git
     ```

3. **Navigate to the Repository Directory:**
   - Change the directory to the one where you have cloned this repository:
     ```
     cd 8086
     ```

4. **Start DOSBox:**
   - Launch DOSBox on your system.

5. **Mount the Repository Directory:**
   - In DOSBox, you need to mount the directory where the programs are located. Assuming your programs are in the `src` directory, use the following command:
     ```
     mount c: /path/to/8086
     ```

6. **Switch to the Mounted Drive:**
   - Change to the mounted drive:
     ```
     C:
     ```

7. **Compile and Run a Program:**
   - To compile a program (let's assume the program is `program.asm`), use the following commands:
     ```
     masm program.asm;
     link program.obj;
     program.exe
     ```

8. **Follow Program Execution:**
   - Depending on the program, follow on-screen prompts or observe the program output.


Feel free to report issues or suggest improvements!

Happy coding!
