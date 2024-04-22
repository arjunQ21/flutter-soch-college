import "package:day10/posts_string.dart";
import "package:flutter/material.dart";

import "list_with_builder.dart";

List<String> fruits = [
  'Apple',
  'Mango',
  'Ban"ana',
  "Guava",
  "papaya",
  'Apple',
  'Apple',
  'Mango',
  "Banana",
  "Guava",
  "papaya",
  'Apple',
  'Mango',
  "Banana",
  "Guava",
  "papaya",
  'Apple',
  'Mango',
  "Banana",
  "Guava",
  "papaya",
  'Mango',
  "Banana",
  "Guava",
  "papaya",
  'Apple',
  'Mango',
  "Banana",
  "Guava",
  "papaya",
  'Apple',
  'Mango',
  "Banana",
  "Guava",
  "papaya",
];

List<int> ages = [5, 56, 27];

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PostsData(),
    ),
  );
}

class PostsData extends StatelessWidget {
  const PostsData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: Text(posts[index]['id'].toString()),
            title: Text(posts[index]['title']),
            // subtitle: Text(posts[index]['body']),
          ),
        );
      },
      itemCount: posts.length,
    ));
  }
}
