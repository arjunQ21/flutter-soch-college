int noOfAnimals = 0;

class Animal {
  String name;
  int legs;
  Animal({required this.name, required this.legs}) {
    noOfAnimals++;
    // print("New Animal Created");
  }

  void show() {
    print("I am a $name and I have $legs legs.");
  }
}

void main() {
  Animal cow = Animal(legs: 4, name: "Cow");
  Animal dog = Animal(legs: 4, name: "dog");
  Animal cat = Animal(legs: 4, name: "cat");
  Animal snake = Animal(legs: 0, name: "snake");
  Animal parrot = Animal(legs: 2, name: "parrot");
  print("$noOfAnimals animals have been created and they say: ");
  cow.show();
  dog.show();
  cat.show();
  snake.show();
  parrot.show();
}
