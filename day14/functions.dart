int add(int a, int b) => a + b;
int add2(int a, int b) {
  return a + b;
}
int difference(int a, int b) {
  return a - b;
}
void runner(Function(int, int) lekoFunction) {
  print("The result is: " + lekoFunction(5, 6).toString());
}
void main() {
  print("The sum of 4 and 5 is: ${add(4, 5)}");
  print("The difference of 4 and 5 is: ${difference(4, 5)}");
  runner(difference);
}
