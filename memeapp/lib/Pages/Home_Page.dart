import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:memeapp/Components/Screens/SignIn_Page.dart';
import 'package:memeapp/Providers/AuthProvider.dart';
import 'package:memeapp/Providers/MemeProvider.dart';
import 'package:memeapp/Resources/Resources.dart';
import 'package:provider/provider.dart';

import '../Components/Screens/Upload_New_Meme.dart';
import 'package:http/http.dart' as http;

class Home_Page extends StatelessWidget {
  const Home_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Authprovider>(builder: (context, aprov, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow.shade700,
          leadingWidth: 40,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (c) => SignIn_Page()));
            },
            icon: Icon(Icons.menu, size: 30),
          ),
          title: Text(
            aprov.user['name'] ?? "UNKNOWN",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 20),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              child: IconButton(
                onPressed: () async {},
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Consumer<MemeProvider>(
            builder: (context, memeProvider, child) {
              if (memeProvider.memes.isEmpty)
                return CircularProgressIndicator();
              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: const Color.fromARGB(255, 248, 246, 230),
                child: ListView.builder(
                  itemCount: memeProvider.memes.length,
                  itemBuilder: (context, index) {
                    var meme = memeProvider.memes[index]['filePath'];
                    var cap = memeProvider.memes[index]['caption'] ?? "";
                    return Column(
                      children: [
                        ListTile(
                          leading: InkWell(
                            onTap: () {},
                            child: ClipOval(
                              child: Image.network(personImg,
                                  width: 50, height: 50, fit: BoxFit.cover),
                            ),
                          ),
                          title: InkWell(
                            onTap: () {},
                            child: Text(
                              memeProvider.memes[index]['uploadedBy']['name'],
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ),
                          subtitle: Text(
                            // date formatting
                            DateFormat(DateFormat.YEAR_MONTH_WEEKDAY_DAY)
                                .format(
                              DateTime.parse(
                                memeProvider.memes[index]['createdAt'],
                              ),
                            ),
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                          trailing: IconButton(
                              onPressed: () {}, icon: Icon(Icons.more_vert)),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Text(
                                cap,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.85,
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                    offset: Offset(1, 1),
                                    spreadRadius: 1,
                                    blurRadius: 10,
                                    color: Colors.grey)
                              ]),
                              child: Image.network(meme),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.favorite_border,
                                          size: 30)),
                                  Text('4 Likes',
                                      style: TextStyle(fontSize: 18))
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.share, size: 30))
                                ],
                              )
                            ],
                          ),
                        ),
                        Divider(color: Colors.black),
                      ],
                    );
                  },
                ),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (c) => Upload_New_Meme()));
          },
          child: Icon(Icons.add),
        ),
      );
    });
  }
}
