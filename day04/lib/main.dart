import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Day 4',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Day4(),
    );
  }
}

class Day4 extends StatelessWidget {
  const Day4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Day 4"),
        ),
        body: Center(
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.red,
              // border: Border(
              //   top: BorderSide(
              //     color: Colors.green,
              //     width: 5,
              //   ),
              // ),
              border: Border.all(
                color: Colors.green,
                width: 5,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  offset: Offset(10, 20),
                  blurRadius: 14,
                  color: Colors.grey,
                  spreadRadius: 20,
                ),
                BoxShadow(
                  offset: Offset(40, 40),
                  blurRadius: 14,
                  color: Colors.yellow,
                  spreadRadius: 20,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(currentIndex: 1, items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Hello"),
          // BottomNavigationBarItem(icon: Icon(Icons.person), label: "Me"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_outlined), label: "Account"),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_activity), label: "Local"),
          // BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add"),
        ]));
  }
}
