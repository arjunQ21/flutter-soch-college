import 'dart:math';

import 'package:day11/people.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  Map<String, dynamic> personDetails;
  ProfilePage({super.key, required this.personDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    height: 140,
                    width: 140,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2),
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                            image: NetworkImage(
                                "${personDetails['image_url']}?jpttext=${Random().nextInt(200)}"))),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    personDetails['name'],
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  )
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 15),
            child: Text(
              personDetails['bio'],
              textAlign: TextAlign.center,
            ),
          ),
          Divider(
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${personDetails['age']} Years old"),
                Text(personDetails['gender']),
              ],
            ),
          ),
          Divider(
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
