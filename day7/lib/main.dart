import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Hello From Home Page"),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                // CupertinoPageRoute(
                MaterialPageRoute(
                  builder: (c) => SecondPage(),
                ),
              );
            },
            child: Text("Click Me"),
          ),
        ],
      )),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Hello From Second Page"),
          ElevatedButton(
            onPressed: () {
              print("Button Clicked");
            },
            child: Text("Click Me"),
          ),
        ],
      )),
    );
  }
}
