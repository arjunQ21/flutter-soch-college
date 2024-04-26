import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.green,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Container(
                margin: EdgeInsets.only(
                  bottom: 12,
                ),
                child: Text(
                  "Hello",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ),
            Image(image: NetworkImage("https://i.stack.imgur.com/YxuB1.png")),
            ElevatedButton(onPressed: () {}, child: Text("Click Me")),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Day 3"),
        centerTitle: true,
        actions: [
          Icon(Icons.add),
          Icon(Icons.crop),
        ],
      ),
    );
  }
}
