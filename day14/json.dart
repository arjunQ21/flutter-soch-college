import "dart:convert";

class Fruit {
  String name;
  String color;
  bool isEdible;
  Fruit({required this.name, required this.color, this.isEdible = true});

  static Fruit parseFromJSON(Map<String, dynamic> rawFruit) {
    return Fruit(
        name: rawFruit['name'],
        color: rawFruit['color'],
        isEdible: rawFruit['isEdible']);
  }
}

var fruitsJSON =
    '[{"name":"Apple","color":"Red","isEdible":true},{"name":"Banana","color":"Yellow","isEdible":true},{"name":"Lemon","color":"Yellow","isEdible":true},{"name":"Blueberry","color":"Blue","isEdible":true},{"name":"Grape","color":"Purple","isEdible":true},{"name":"Tomato","color":"Red","isEdible":true}]';

void main() {
  List<dynamic> decodedFruits = jsonDecode(fruitsJSON);
  List<Map<String, dynamic>> moreDecodedFruits = [];
  // using for loop to convert type
  for (var fruit in decodedFruits) {
    moreDecodedFruits.add(fruit as Map<String, dynamic>);
  }
  print(moreDecodedFruits.runtimeType);
  List<Fruit> decodedFruitsType =
      moreDecodedFruits.map((e) => Fruit.parseFromJSON(e)).toList();
  print(decodedFruitsType.runtimeType);
}
