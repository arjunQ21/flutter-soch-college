import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final Function(String) onGenderChange;
  final Map<String, dynamic> personDetails;
  const ProfilePage(
      {super.key, required this.personDetails, required this.onGenderChange});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late String gender = widget.personDetails['gender'];
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
      body: SingleChildScrollView(
        child: Column(
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
                                  "${widget.personDetails['image_url']}"))),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    // SizedBox(
                    //   width: 300,
                    //   height: 80,
                    //   child: TextField(

                    //   ),
                    // ),
                    // TextField(),
                    Text(
                      widget.personDetails['name'],
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 15),
              child: Text(
                widget.personDetails['bio'],
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
                  Text("${widget.personDetails['age']} Years old"),
                  Row(
                    children: [
                      Switch(
                        onChanged: (changeVakoValue) {
                          if (changeVakoValue == true) {
                            gender = 'male';
                          } else {
                            gender = 'female';
                          }
                          setState(() {});
                          widget.onGenderChange(gender);
                        },
                        value: gender == "male" ? true : false,
                      ),
                      Text(gender),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
