import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Posts App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Posts App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    textEditingController.text = "https://jsonplaceholder.typicode.com/posts";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        children: [
          Text("Posts App"),
          Text(
            "1",
            style: TextStyle(
              color: Colors.green,
              fontSize: 18,
            ),
          ),
          Text(
            "2",
            style: TextStyle(
              color: Colors.green,
              fontSize: 18,
            ),
          ),
          Text(
            "3",
            style: TextStyle(
              color: Colors.green,
              fontSize: 18,
            ),
          ),
          Text(
            "4",
            style: TextStyle(
              color: Colors.green,
              fontSize: 18,
            ),
          ),
          Text(
            "5",
            style: TextStyle(
              color: Colors.green,
              fontSize: 18,
            ),
          ),
          Text(
            "6",
            style: TextStyle(
              color: Colors.green,
              fontSize: 18,
            ),
          ),
          Text(
            "7",
            style: TextStyle(
              color: Colors.green,
              fontSize: 18,
            ),
          ),
          Text(
            "8",
            style: TextStyle(
              color: Colors.green,
              fontSize: 18,
            ),
          ),
          Text(
            "9",
            style: TextStyle(
              color: Colors.green,
              fontSize: 18,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    1,
                    2,
                    3,
                    4,
                    5,
                    6,
                    7,
                    8,
                    9,
                    2,
                    3,
                    4,
                    5,
                    6,
                    7,
                    8,
                    9,
                  ]
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "$e",
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      )
                      .toList()),
            ),
          ),
        ],
      )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                    height: 80,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextField(
                      controller: textEditingController,
                    )),
                IconButton(
                    onPressed: () {
                      setState(() {});
                    },
                    icon: Text("Go")),
              ],
            ),
            Expanded(
              child: textEditingController.text.isNotEmpty
                  ? SingleChildScrollView(
                      child: FutureBuilder(
                          future:
                              http.get(Uri.parse(textEditingController.text)),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              var response = snapshot.data!;
                              // type conversion
                              // using list.map to convert data type(parsing)
                              List<Map<String, dynamic>> convertedResponse =
                                  (jsonDecode(response.body) as List<dynamic>)
                                      .map((e) => e as Map<String, dynamic>)
                                      .toList();
                              return Column(
                                // using list.map to make UI
                                children: convertedResponse
                                    .map(
                                      (e) => ListTile(
                                        leading: Text(e['id'].toString()),
                                        title: Text(
                                          e['title'],
                                        ),
                                        subtitle: Text(e['body']),
                                      ),
                                    )
                                    .toList(),
                              );
                            } else if (snapshot.hasError) {
                              return Text(
                                "Error: ${snapshot.error}",
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              );
                            } else {
                              // loading state
                              return Center(child: CircularProgressIndicator());
                            }
                          }),
                    )
                  : Text("Enter Someting First"),
            ),
          ],
        ),
      ),
    );
  }
}
