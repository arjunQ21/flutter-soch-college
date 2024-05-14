int? num ;
bool? condition ;

class Test{
  String name  ;
  Test(this.name) ;
  @override
  String toString(){
    return "Hello $name" ;
  }
//   Null Aware
}

void main() {
  print(Test("Nikesh")) ;
  Test? testing ;
  print(testing??Test("Ram")) ;
  num = 0 ;
  if(num!   > 4){
    condition = false ;
  }
  

  
   if(condition ?? true){
    print("Hello there") ;
  }else{
     print("Bye bye") ;
   }
  
  if(num == null){
    print("No Number") ;
  }else{
    print("Value: $num") ;
  }

//   ??
  
  String op = (num ?? 1).toString() ;
  
  print(op) ;
//   ?:
//   ??
//   print("$num") ;
}

