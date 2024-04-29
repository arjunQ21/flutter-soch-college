int count = 0;
void sayHi() {
  print("${++count}: Hello World");
}

Future<void> waitFor(int seconds) async {
  await Future.delayed(Duration(seconds: seconds), () {
    print("Waited for $seconds seconds.");
  });
}

void main() async {
  sayHi();
  await waitFor(4);
  sayHi();
}
