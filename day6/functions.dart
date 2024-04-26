var names = ['Ram', "Shyam", "Hari", "Krishna"];

void sayHi(String name, {String? secondName}) {
  print("Hi " + name + (secondName != null ? ", " + secondName : ""));
}

void main() {
  // sayHi("Ram");
  print("Names are:");
  // for (int i = 0; i < names.length; i++) {
  //   print(names[i]);
  // }
  print(names.join("\n"));
  print("Hello Ram.");
  var numbers = [1, 2, 3, 4];
  int mappingFunction(x) {
    return x + 2;
  }

  // var output = numbers.map(mappingFunction);
  // print(output);
  print(names.map((name) => "Hello " + name + ".\n").toList().join(""));
}
