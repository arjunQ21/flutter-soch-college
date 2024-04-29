import 'dart:math';

class Animal {
  static List<Animal> createdAnimals = [];
  String name;
  int legs;
  String sound;
  Animal({required this.name, required this.legs, this.sound = 'hmm'}) {
    createdAnimals.add(this);
  }

  void show() {
    print("I am a $name, I walk with $legs legs saying $sound.");
  }

  void removeALeg() {
    print("Removed a leg of $name. New legs: ${--legs}");
  }

  void addALeg() {
    print("Added a leg of $name. New legs: ${++legs}");
  }

  static void removeALegForAll() {
    for (Animal loopAnimal in createdAnimals) {
      loopAnimal.removeALeg();
    }
  }

  static void addALegForAll() {
    for (Animal testAnimal in createdAnimals) {
      testAnimal.addALeg();
    }
  }

  static int getRandomIndex() => (createdAnimals.length > 0)
      ? Random().nextInt(createdAnimals.length)
      : -1;

  static void setLegsTo5ForRandomAnimal() {
    int indexToRemoveAt = getRandomIndex();
    if (indexToRemoveAt != -1) {
      createdAnimals[indexToRemoveAt].legs = 5;
      print("Set legs to 5 of ${createdAnimals[indexToRemoveAt].name}.");
    } else {
      print("No more animals found.");
    }
  }

  static void removeRandomAnimal() {
    int indexToRemoveAt = getRandomIndex();
    if (indexToRemoveAt != -1) {
      createdAnimals.removeAt(indexToRemoveAt);
      print("Removed an animal at index: $indexToRemoveAt");
    } else {
      print("No more animals to remove");
    }
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
  Animal.addALegForAll();
  Animal.showDetails();
  Animal.removeALegForAll();
  Animal.showDetails();
  Animal.removeRandomAnimal();
  Animal.showDetails();
  Animal.setLegsTo5ForRandomAnimal();
  Animal.showDetails();
}
