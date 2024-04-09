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
            border: Border(
              top: BorderSide(
                color: Colors.green,
                width: 5,
              ),
            ),
            // border: Border.all(
            //   color: Colors.green,
            //   width: 5,
            // ),
          ),
        ),
      ),
    );
  }
}
