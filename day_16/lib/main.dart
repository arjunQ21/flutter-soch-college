import "package:flutter/material.dart";

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
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
  bool hasBorderRadius = false;
  TextEditingController textEditingController = TextEditingController();
  int topOffset = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
                child: Column(
              children: [
                SizedBox(
                  height: topOffset * 1.0,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.green,
                  ),
                  child: Text(
                    "HI",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                )
              ],
            )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 80,
                    child: Focus(
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Divider(),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text("Top Offset"),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  topOffset++;
                                  setState(() {});
                                },
                                icon: Icon(Icons.add),
                              ),
                              Text(
                                topOffset.toString(),
                                style: TextStyle(fontSize: 20),
                              ),
                              IconButton(
                                onPressed: () {
                                  topOffset--;
                                  setState(() {});
                                },
                                icon: Icon(Icons.remove),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Border Radius:"),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                hasBorderRadius = !hasBorderRadius;
                              });
                            },
                            icon: Icon(
                              hasBorderRadius
                                  ? Icons.check_box
                                  : Icons.check_box_outline_blank,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
