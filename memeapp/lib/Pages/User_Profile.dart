// import 'package:flutter/cupertino.dart';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:memeapp/Components/Dialogs/Dialog_Box.dart';
import 'package:memeapp/Components/Dialogs/edit_Box.dart';
// import 'package:memeapp/Components/Screens/SignIn_Page.dart';
import 'package:memeapp/Providers/AuthProvider.dart';
import 'package:memeapp/Providers/MemeProvider.dart';
import 'package:mime/mime.dart';
// import 'package:memeapp/Providers/MemeProvider.dart';
import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

import '../Resources/Resources.dart';

class UserProfile extends StatefulWidget {
  UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final textStyle =
      TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500);

  late String name;
  late String email;
  late String phone;
  late String? imageURL;

  @override
  void initState() {
    var aProv = Provider.of<Authprovider>(context, listen: false);
    name = aProv.user['name'];
    email = aProv.user['email'];
    phone = aProv.user['phone'];
    imageURL = aProv.user['imageURL'];
    super.initState();

// setState(() {
// });
  }

  final ImagePicker picker = ImagePicker();
  XFile? pickedImage;

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
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // SizedBox(height: 20),
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      border: Border.all(width: 3, color: Colors.red),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: ClipOval(
                      child: Image.network(
                        imageURL ?? personImg,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () async {
                        pickedImage =
                            await picker.pickImage(source: ImageSource.gallery);
                        if (pickedImage == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Choose an image first")));
                          return;
                        }
                        await showDialog(
                          context: context,
                          builder: (c) => EditBox(
                            name: name,
                            onNameChanged: (v) {
                              name = v;
                              setState(() {});
                            },
                            phone: phone,
                            onPhoneChanged: (v) {
                              phone = v;
                              setState(() {});
                            },
                          ),
                        );
                        try {
                          var request = http.MultipartRequest(
                            "PUT",
                            Uri.parse("$myIP/users/me"),
                          );

                          var headers = {
                            "Authorization": "Bearer ${MemeProvider.header}"
                          };
                          request.headers.addAll(headers);
// adding text props to request
                          request.fields.addAll({
                            "phone": phone,
                            "name": name,
                          });
                          // adding files to request
                          request.files.add(
                            await http.MultipartFile.fromPath(
                              "image",
                              pickedImage!.path,
                              contentType: MediaType.parse(
                                lookupMimeType(pickedImage!.path)!,
                              ),
                            ),
                          );
                          var response = await request.send();

                          var responseBody =
                              await response.stream.bytesToString();

                          if (response.statusCode != 201) {
                            throw Exception(
                                "Failed to update profile: $responseBody");
                          } else {
                            await Provider.of<Authprovider>(context,
                                    listen: false)
                                .getUserFromSavedToken();
                          }
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Error: $e")));
                        }
                      },
                      icon: Icon(Icons.edit_square)),
                  // SizedBox(height: 10),
                  Text(name,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Container(
                    // width: MediaQuery.of(context).size.width * 0.5,
                    // color: Colors.red,
                    // mainAxisSize: ,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.mail)),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child:
                                  Text(email, style: TextStyle(fontSize: 18)),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.phone_android)),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text(
                                phone,
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
              // ),
            ),
          ),
        ),
      ),
    );
  }
}
