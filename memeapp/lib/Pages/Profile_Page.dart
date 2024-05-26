// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memeapp/Components/Dialogs/Dialog_Box.dart';
import 'package:memeapp/Components/Dialogs/Inside_Name.dart';
// import 'package:memeapp/Components/Screens/SignIn_Page.dart';
import 'package:memeapp/Providers/AuthProvider.dart';
// import 'package:memeapp/Providers/MemeProvider.dart';
import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

import '../Resources/Resources.dart';

class Profile_Page extends StatefulWidget {
  final Map<String, dynamic> myUsers;

  Profile_Page({super.key, required this.myUsers});

  @override
  State<Profile_Page> createState() => _Profile_PageState();
}

class _Profile_PageState extends State<Profile_Page> {
  final textStyle =
      TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade700,
        leadingWidth: 50,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios_new_outlined, size: 30)),
        title: Text(
          'Profile',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
        actions: [
          InkWell(
            onTap: () async {
              showDialog(context: context, builder: (context) => Dialog_Box());
            },
            child: Container(
              margin: EdgeInsets.only(right: 20),
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Icon(Icons.logout_rounded, color: Colors.white),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color.fromARGB(255, 255, 254, 243),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Consumer<Authprovider>(builder: (context, aProv, child) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Container(
                      width: 220,
                      height: 220,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        border: Border.all(width: 3, color: Colors.red),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: ClipOval(
                        child: Image.network(
                          '$personImg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text("Personal Details",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.amber.shade700,
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(1, 1),
                                  blurRadius: 10,
                                  spreadRadius: 10,
                                  color: Colors.grey.shade600)
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 80, top: 25, bottom: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Divider(color: Colors.black),

                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10.0),
                                child: Text(
                                  'Name:  ${widget.myUsers['uploadedBy']['name']}',
                                  style: textStyle,
                                ),
                              ),
                              // SizedBox(height: 15),
                              Divider(color: Colors.black),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10.0),
                                child: Text(
                                  'Role:  ${widget.myUsers['uploadedBy']['role']}',
                                  style: textStyle,
                                ),
                              ),
                              // SizedBox(height: 15),
                              Divider(color: Colors.black),

                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10.0),
                                child: Text(
                                  'Email: ${widget.myUsers['uploadedBy']['email']}',
                                  style: textStyle,
                                ),
                              ),
                              // SizedBox(height: 15),
                              Divider(color: Colors.black),

                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10.0),
                                // child: Text(
                                //   'Phone:  ${widget.myUsers['uploadedBy']['phone']}',
                                //   style: textStyle,
                                // ),
                              ),
                              // Divider(color: Colors.black),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
