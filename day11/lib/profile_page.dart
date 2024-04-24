import 'dart:math';

import 'package:day11/people.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  int personIndex;
  ProfilePage({super.key, required this.personIndex});

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
                    alignment: Alignment.center,
                    height: 140,
                    width: 140,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2),
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                            image: NetworkImage(
                                "${people[personIndex]['image_url']}?jpttext=${Random().nextInt(200)}"))),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    people[personIndex]['name'],
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
              people[personIndex]['bio'],
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
                Text("${people[personIndex]['age']} Years old"),
                Text(people[personIndex]['gender']),
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
