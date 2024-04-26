import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: StackDetails(),
  ));
}

class StackDetails extends StatelessWidget {
  const StackDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack Study"),
      ),
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 160,
                  width: 160,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(300),
                  ),
                ),
              ),
              Positioned(
                top: 120,
                left: 60,
                child: Container(
                  height: 100,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Text(
                  "Hari",
                  style: TextStyle(
                    backgroundColor: Colors.brown,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "Ram",
                  style: TextStyle(
                    backgroundColor: Colors.brown,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                  top: 60,
                  left: 60,
                  height: 40,
                  child: Image.network(
                      "https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg")),
            ],
          ),
        ),
      ),
    );
  }
}
