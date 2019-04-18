# Assembler
	각각의 아키텍쳐는 약속된 instruction code 가 있는데, 이번에는 어셈블리 언어를 instruction code 로 바꾸어 주는 어셈블러를 만들었다.
    instruction code는 16-bit 으로 이루어져 있으며, 16-bit 내에서는 dest, comp, jump 부분으로 나뉘어지게 된다.  
    dest : 연산한 결과를 어느 레지스터(A, D, M) 에 저장할 것인지  
    comp : 어느 연산을 할 것인지  
    jump : 어느 조건으로 Jump를 할 것인지  
    
    *Python 파일 소개*
    - Parser : .asm 파일을 받아 주석과 white space 를 제거하고 필요한 부분을 각각 파싱하게 된다.
    - Code :  Parser로부터 파싱한 symbol 을 받아서 알맞은 instruction code 를 제공하게 된다. 
    - SymbolTable : 어셈블리를 작성하다 보면 임시변수라던가, 고유 레지스터를 사용하는 경우가 생긴다.(LCL, ARG, THIS, THAT..)  
    				그러한 레지스터를 등록/관리 할 수 있다.  
                    
