// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

Color pColor = Colors.blue;

class ChatHome extends StatelessWidget {
  const ChatHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: pColor,
        foregroundColor: Colors.white,
        title: Text(
          "Messaging App",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: FutureBuilder(
                    future: http.get(Uri.parse(
                        "https://ca0f-43-245-85-244.ngrok-free.app/messages")),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text(
                          "Error: ${snapshot.error}",
                          style: TextStyle(color: Colors.red),
                        );
                      } else if (snapshot.hasData) {
                        var decodedResponse = jsonDecode(snapshot.data!.body);
                        if (decodedResponse['status'] == 'success') {
                          List messages = decodedResponse['data']['messages'];
                          print(messages);
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            // using for loop
                            // children: [
                            // for (var message in messages)
                            //   MsgContainer(
                            //     msg: message.toString(),
                            //   ),
                            // ],
                            // using list.map
                            children: messages.reversed
                                .map((e) => MsgContainer(msg: e.toString()))
                                .toList(),
                          );
                        } else {
                          return Text("Something went wrong");
                        }
                      } else {
                        // loading condition
                        return CircularProgressIndicator();
                      }
                    }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Enter message here...",
                      filled: true,
                      fillColor: const Color.fromARGB(255, 231, 230, 230),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.send,
                    color: pColor,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MsgContainer extends StatelessWidget {
  String msg;
  MsgContainer({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 50,
      width: MediaQuery.of(context).size.width * .3,
      decoration: BoxDecoration(
        color: Colors.blue.shade900,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            textAlign: TextAlign.end,
            msg,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
