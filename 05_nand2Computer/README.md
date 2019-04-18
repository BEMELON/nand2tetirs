# Computer  Architecture  

	이전 프로젝트에서 제작하였던 ALU 와 메모리들을 활용해 하나의 아키텍쳐를 제작하였다.  
    
    - Bus16.hdl : 1-Bit 버스를 16-Bit로 확장시키는 hdl 파일  
    - DMux16.hdl : 16비트 DMUX
    - CPU.hdl -> CPU.out : 메모리와 *instruction code* 를 받아 해석을 한 후 결과값을 필요한 곳에 분배하게 된다.  
    - Memory.hdl -> Memory.out : 메모리 주소와 Read/ Write 신호를 받아 값을 저장/읽는다. 
    - Computer.hdl -> ComputerAdd,Max,Rect.out :  메모리, CPU, ROM 을 합치어 HACK 컴퓨터를 만들었다. 
