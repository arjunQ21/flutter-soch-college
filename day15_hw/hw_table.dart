Future<void> showTableOf(int n) {
  int waitingTime = (n - 1) * 500;
  if (n != 1) {
    print("Waiting for $waitingTime ms.");
  }
  return Future.delayed(
    Duration(milliseconds: waitingTime),
  ).then((value) {
    print(tableOf(n));
    if (n < 10) return showTableOf(n + 1);
  });
}

String tableOf(int n) {
  String toReturn = "The table of $n is:\n";
  for (int i = 1; i <= 10; i++) {
    toReturn += "$n*$i = ${n * i}\n";
  }
  return toReturn;
}

void main() {
  showTableOf(1);
}
