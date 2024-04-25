import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final Function(String) onGenderChange;
  final Function(int) onAgeChange;
  final Function(String) onNameChange;
  final Map<String, dynamic> personDetails;
  const ProfilePage({
    super.key,
    required this.onNameChange,
    required this.personDetails,
    required this.onGenderChange,
    required this.onAgeChange,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late String gender = widget.personDetails['gender'];
  late int age = widget.personDetails['age'];
  late String name = widget.personDetails['name'];

  TextEditingController hamroController = TextEditingController();

  @override
  void initState() {
    hamroController.text = widget.personDetails['name'];
    super.initState();
  }

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
                      name,
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
                  Row(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              if (age <= 0) return;
                              setState(() {
                                age--;
                              });
                              widget.onAgeChange(age);
                            },
                            icon: Icon(Icons.remove),
                          ),
                          Text(
                            age.toString(),
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              if (age == 150) return;
                              setState(() {
                                age++;
                              });
                              widget.onAgeChange(age);
                            },
                            icon: Icon(Icons.add),
                          ),
                        ],
                      ),
                      Text("Years old"),
                    ],
                  ),
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
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 80,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: TextField(
                  controller: hamroController,
                  decoration: InputDecoration(
                    labelText: "Enter Name",
                    hintText: "Your name here.",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                        width: 2,
                      ),
                    ),
                    // focusedBorder: OutlineInputBorder(
                    //   borderSide: BorderSide(
                    //     color: Colors.green,
                    //     width: 2,
                    //   ),
                    // ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    name = hamroController.text;
                  });
                  widget.onNameChange(name);
                },
                child: Text("Update")),
          ],
        ),
      ),
    );
  }
}
