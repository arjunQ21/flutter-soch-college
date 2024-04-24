import 'dart:math';

import 'package:day11/people.dart';
import 'package:day11/profile_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: PeopleList(),
  ));
}

class PeopleList extends StatelessWidget {
  const PeopleList({
    super.key,
  });

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
              )),
              child: ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          ProfilePage(personDetails: people[index]),
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
