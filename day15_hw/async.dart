import 'dart:math';

int count = 0;
void sayHi() {
  print("${++count}: Hello World");
}

Future<void> waitFor(int seconds) async {
  await Future.delayed(Duration(seconds: seconds), () {
    print("Waited for $seconds seconds.");
  });
}

Future<void> showNextSecondAfter(int afterWhat) async {
  if (afterWhat > 5) return;
  await waitFor(1);
  print("$afterWhat seconds.");
  await showNextSecondAfter(afterWhat + 1);
}

// a function that return a random number after 2 seconds.
Future<int> randomNo() {
  return Future.delayed(Duration(seconds: 1), () {
    int genNo = Random().nextInt(5);
    if (genNo > 2) throw Exception("2 vanda thulo vayo");
    return genNo;
  });
}

void main() async {
// Error handling
 // Callback Style
  await randomNo().then((value) {
    print("Random number: $value");
  }).catchError((error) {
    print("Error caught from callback style. Error says: " + error.toString());
  });

// Synchronous style
  try {
    int randomInt = await randomNo();
    print("Random number: $randomInt");
  } catch (e) {
    print("Error caught synchronously. Error says: " + e.toString());
  }

 
}
