import 'dart:math';

import 'package:flutter/material.dart';

import 'people.dart';
import 'profile_page.dart';

class PeopleList extends StatefulWidget {
  const PeopleList({
    super.key,
  });

  @override
  State<PeopleList> createState() => _PeopleListState();
}

class _PeopleListState extends State<PeopleList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("People List")),
      body: ListView.builder(
          itemCount: people.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                  border: Border.all(
                width: 1,
                color: people[index]['gender'] == 'male'
                    ? Colors.blue
                    : Colors.pink,
              )),
              child: ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(
                        personDetails: people[index],
                        onGenderChange: (changeVakoGender) {
                          print(
                              "Gender change vayexa uta. New Gender: $changeVakoGender");
                          people[index]['gender'] = changeVakoGender;
                          setState(() {});
                        },
                      ),
                    ),
                  );
                },
                contentPadding: EdgeInsets.zero,
                title: Text(people[index]['name']),
                subtitle: Text("${people[index]['age']} years old."),
                leading: Image.network(
                  "${people[index]['image_url']}?jpttext=${Random().nextInt(200)}",
                ),
              ),
            );
          }),
    );
  }
}
