import "package:flutter/material.dart";

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int noOfBalls = 30;
  double circleSize = 50;
  bool isBGGreen = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stateful Widgets")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Wrap(
                // crossAxisAlignment: CrossAxisAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                children: [
                  for (int i = 0; i < noOfBalls; i++)
                    Container(
                      margin: EdgeInsets.all(8),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        border: Border.all(width: 2, color: Colors.black),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Circle Size:",
                  style: TextStyle(fontSize: 18),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        print("Athio");
                      },
                      child: Container(
                        height: 40,
                        width: 50,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                        ),
                        child: Icon(Icons.remove),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 50,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        // borderRadius: BorderRadius.only(
                        //   topLeft: Radius.circular(10),
                        //   bottomLeft: Radius.circular(10),
                        // ),
                      ),
                      child: Center(
                        child: Text(
                          "5",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        print("Plus athio");
                      },
                      child: Container(
                        height: 40,
                        width: 50,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        child: Icon(Icons.add),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "No of Balls:",
                  style: TextStyle(fontSize: 18),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        if (noOfBalls == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Cannot reduce more than 0")));
                          return;
                        }
                        noOfBalls = noOfBalls - 1;
                        setState(() {});
                      },
                      child: Container(
                        height: 40,
                        width: 50,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                        ),
                        child: Icon(Icons.remove),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 50,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        // borderRadius: BorderRadius.only(
                        //   topLeft: Radius.circular(10),
                        //   bottomLeft: Radius.circular(10),
                        // ),
                      ),
                      child: Center(
                        child: Text(
                          noOfBalls.toString(),
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        print("Plus athio");
                      },
                      child: Container(
                        height: 40,
                        width: 50,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        child: Icon(Icons.add),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "BG Color Green:",
                  style: TextStyle(fontSize: 18),
                ),
                Switch(value: false, onChanged: (f) {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
