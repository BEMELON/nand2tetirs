@17
D=A // D = n
@SP
A=M // dereference
M=D // *sp = D
@SP
M=M+1 // sp++
@17
D=A // D = n
@SP
A=M // dereference
M=D // *sp = D
@SP
M=M+1 // sp++
@SP
AM=M-1 // sp--
D=M // D = TOP element
@SP
A=M-1 // M = second element from top
D=M-D
@JEQ_CONDITION0
D;JEQ//Jump condition 
@SP
A=M-1
M=0 // FALSE
@Else_JEQ0
0;JMP
(JEQ_CONDITION0)
@SP
A=M-1
M=-1 // if
(Else_JEQ0)
@17
D=A // D = n
@SP
A=M // dereference
M=D // *sp = D
@SP
M=M+1 // sp++
@16
D=A // D = n
@SP
A=M // dereference
M=D // *sp = D
@SP
M=M+1 // sp++
@SP
AM=M-1 // sp--
D=M // D = TOP element
@SP
A=M-1 // M = second element from top
D=M-D
@JEQ_CONDITION1
D;JEQ//Jump condition 
@SP
A=M-1
M=0 // FALSE
@Else_JEQ1
0;JMP
(JEQ_CONDITION1)
@SP
A=M-1
M=-1 // if
(Else_JEQ1)
@16
D=A // D = n
@SP
A=M // dereference
M=D // *sp = D
@SP
M=M+1 // sp++
@17
D=A // D = n
@SP
A=M // dereference
M=D // *sp = D
@SP
M=M+1 // sp++
@SP
AM=M-1 // sp--
D=M // D = TOP element
@SP
A=M-1 // M = second element from top
D=M-D
@JEQ_CONDITION2
D;JEQ//Jump condition 
@SP
A=M-1
M=0 // FALSE
@Else_JEQ2
0;JMP
(JEQ_CONDITION2)
@SP
A=M-1
M=-1 // if
(Else_JEQ2)
@892
D=A // D = n
@SP
A=M // dereference
M=D // *sp = D
@SP
M=M+1 // sp++
@891
D=A // D = n
@SP
A=M // dereference
M=D // *sp = D
@SP
M=M+1 // sp++
@SP
AM=M-1 // sp--
D=M // D = TOP element
@SP
A=M-1 // M = second element from top
D=M-D
@JLT_CONDITION0
D;JLT//Jump condition 
@SP
A=M-1
M=0 // FALSE
@Else_JLT0
0;JMP
(JLT_CONDITION0)
@SP
A=M-1
M=-1 // if
(Else_JLT0)
@891
D=A // D = n
@SP
A=M // dereference
M=D // *sp = D
@SP
M=M+1 // sp++
@892
D=A // D = n
@SP
A=M // dereference
M=D // *sp = D
@SP
M=M+1 // sp++
@SP
AM=M-1 // sp--
D=M // D = TOP element
@SP
A=M-1 // M = second element from top
D=M-D
@JLT_CONDITION1
D;JLT//Jump condition 
@SP
A=M-1
M=0 // FALSE
@Else_JLT1
0;JMP
(JLT_CONDITION1)
@SP
A=M-1
M=-1 // if
(Else_JLT1)
@891
D=A // D = n
@SP
A=M // dereference
M=D // *sp = D
@SP
M=M+1 // sp++
@891
D=A // D = n
@SP
A=M // dereference
M=D // *sp = D
@SP
M=M+1 // sp++
@SP
AM=M-1 // sp--
D=M // D = TOP element
@SP
A=M-1 // M = second element from top
D=M-D
@JLT_CONDITION2
D;JLT//Jump condition 
@SP
A=M-1
M=0 // FALSE
@Else_JLT2
0;JMP
(JLT_CONDITION2)
@SP
A=M-1
M=-1 // if
(Else_JLT2)
@32767
D=A // D = n
@SP
A=M // dereference
M=D // *sp = D
@SP
M=M+1 // sp++
@32766
D=A // D = n
@SP
A=M // dereference
M=D // *sp = D
@SP
M=M+1 // sp++
@SP
AM=M-1 // sp--
D=M // D = TOP element
@SP
A=M-1 // M = second element from top
D=M-D
@JGT_CONDITION0
D;JGT//Jump condition 
@SP
A=M-1
M=0 // FALSE
@Else_JGT0
0;JMP
(JGT_CONDITION0)
@SP
A=M-1
M=-1 // if
(Else_JGT0)
@32766
D=A // D = n
@SP
A=M // dereference
M=D // *sp = D
@SP
M=M+1 // sp++
@32767
D=A // D = n
@SP
A=M // dereference
M=D // *sp = D
@SP
M=M+1 // sp++
@SP
AM=M-1 // sp--
D=M // D = TOP element
@SP
A=M-1 // M = second element from top
D=M-D
@JGT_CONDITION1
D;JGT//Jump condition 
@SP
A=M-1
M=0 // FALSE
@Else_JGT1
0;JMP
(JGT_CONDITION1)
@SP
A=M-1
M=-1 // if
(Else_JGT1)
@32766
D=A // D = n
@SP
A=M // dereference
M=D // *sp = D
@SP
M=M+1 // sp++
@32766
D=A // D = n
@SP
A=M // dereference
M=D // *sp = D
@SP
M=M+1 // sp++
@SP
AM=M-1 // sp--
D=M // D = TOP element
@SP
A=M-1 // M = second element from top
D=M-D
@JGT_CONDITION2
D;JGT//Jump condition 
@SP
A=M-1
M=0 // FALSE
@Else_JGT2
0;JMP
(JGT_CONDITION2)
@SP
A=M-1
M=-1 // if
(Else_JGT2)
@57
D=A // D = n
@SP
A=M // dereference
M=D // *sp = D
@SP
M=M+1 // sp++
@31
D=A // D = n
@SP
A=M // dereference
M=D // *sp = D
@SP
M=M+1 // sp++
@53
D=A // D = n
@SP
A=M // dereference
M=D // *sp = D
@SP
M=M+1 // sp++
@SP
AM=M-1 // sp--
D=M // D = TOP element
@SP
A=M-1 // M = second element from top
M=M+D //ADD
@112
D=A // D = n
@SP
A=M // dereference
M=D // *sp = D
@SP
M=M+1 // sp++
@SP
AM=M-1 // sp--
D=M // D = TOP element
@SP
A=M-1 // M = second element from top
M=M-D //SUB
@SP
A=M-1 // dereference
M=-M // NEG
@SP
AM=M-1 // sp--
D=M // D = TOP element
@SP
A=M-1 // M = second element from top
M=M&D //AND
@82
D=A // D = n
@SP
A=M // dereference
M=D // *sp = D
@SP
M=M+1 // sp++
@SP
AM=M-1 // sp--
D=M // D = TOP element
@SP
A=M-1 // M = second element from top
M=M|D // OR
@SP
A=M-1 // dereference
M=!M// NOT
