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
  // sayHi();
  for (int i = 0; i < 10; i++) {
    print("${i + 1} seconds");
    await waitFor(1);
  }
  // sayHi();
}
