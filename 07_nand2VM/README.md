# VM  

어셈블리를 넘어 고수준 언어를 지원하기 위해서는 중간에 **Virtual Machine** 이 필요하다.  
언어는 각각의 컴파일러가 있고, 모든 아키텍쳐는 약속된 *instruction code* 가 있다.  
이러한 다양성 때문에 고수준 언어가 직접적으로 *instruction code* 를 생성하는 데는 무리가 있다.  
여기서 VM은 하나의 중계소 역할을 한다. VM도 마찬가지로 ** VM Language ** 가 있는데 이는 컴파일러가 생성하게 된다.  
**VM Language ** 은 **Translater**를 거치게 되면서 아키텍쳐에 알맞은 어셈블리 언어로 변환되게 된다.  
따라서, 새로운 아키텍쳐를 개발을 하게 된다면 ** VM Translater ** 를 같이 제공한다는 내용이 있었다.   
이 과정에서 Stack 연산을 주로 하게 되는데, 타 자료구조보다 깔끔한 구조를 유지할 수 있어서 채택했다 한다.  



- Parser : .vm 파일을 읽어 주석과 white space 를 제거 후 필요한 symbol 만 제공할 수 있도록 한다.  
- CodeWriter : Parser 로부터 제공받은 Symbol 들로 알맞은 어셈블리 코드를 .asm 파일로 작성하게 된다.  
- translater : main 파일
