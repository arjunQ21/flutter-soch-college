import "package:flutter/material.dart";

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int noOfPresses = 0;
  bool isSwitchedOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isSwitchedOn ? Colors.red : Colors.blue,
      appBar: AppBar(title: Text("Demo Home Page")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Use Red Color: "),
              Switch(
                  value: isSwitchedOn,
                  onChanged: (v) {
                    // if (v) {
                    //   isSwitchedOn = true;
                    // } else {
                    //   isSwitchedOn = false;
                    // }
                    isSwitchedOn = v;
                    setState(() {});
                  }),
            ],
          ),
          Text("You have pressed the button this many times:"),
          Text(
            "$noOfPresses",
            style: TextStyle(
              fontSize: 30 + 1.2 * noOfPresses,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          noOfPresses++;
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
