# MachineLangugage  
폰 노이만 아키텍쳐와 하버드 아키텍쳐의 차이점에 대해서 공부하였고,   
폰 노이만 아키텍쳐를 사용할 경우 *Address instruction code* 와 *Command instruction code* 를 구별하기 위해 하나의 비트를 소모한다는 것을 알게 되었다.  
나름 추상화가 되어있는(?) 어셈블리 언어를 통하여 앞서 만들었던 RAM 과 ALU 를 제어하였다.  
또한, 키보드와 모니터가 어느한 방식으로 CPU와 협력하는지 알 수 있었다.  

- mult.asm -> Mult.out : 레지스터의 곱셈을 테스트 
- Fill.asm -> FillAutomatic.out : 키보드 입력을 감지하였으면 화면을 검정색으로, 아니면 하얀색으로 채운다. 
