class Animal {
  static List<Animal> createdAnimals = [];
  String name;
  int legs;
  Animal({required this.name, required this.legs}) {
    createdAnimals.add(this);
  }

  void show() {
    print("I am a $name and I have $legs legs.");
  }

  static void showDetails() {
    print(
        "${Animal.createdAnimals.length} animals have been created and they say: ");
    for (int i = 0; i < Animal.createdAnimals.length; i++)
      Animal.createdAnimals[i].show();
  }
}

void main() {
  Animal(legs: 4, name: "Cow");
  Animal(legs: 4, name: "dog");
  Animal(legs: 4, name: "cat");
  Animal(legs: 0, name: "snake");
  Animal(legs: 2, name: "parrot");
  Animal.showDetails();
}
