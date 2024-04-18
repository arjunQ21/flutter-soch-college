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
        title: Text("Multiplication Table"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Click on a Number to see its table.",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Wrap(
              children: [
                for (int i = 1; i <= 10; i++)
                  NumberTile(
                    numberToShow: i,
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class NumberTile extends StatelessWidget {
  int numberToShow;
  NumberTile({
    super.key,
    required this.numberToShow,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            // CupertinoPageRoute(
            MaterialPageRoute(
              builder: (c) => SecondPage(
                tableNumber: numberToShow,
              ),
            ),
          );
        },
        child: Text(
          numberToShow.toString(),
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  int tableNumber;
  SecondPage({
    super.key,
    required this.tableNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.tableNumber.toString()),
      ),
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Hello From Second Page"),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Navigator.pop(context);
            },
            child: Text("Go Back"),
          ),
        ],
      )),
    );
  }
}
