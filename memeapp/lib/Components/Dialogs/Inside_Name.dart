import 'package:flutter/material.dart';
import 'package:memeapp/Providers/AuthProvider.dart';
import 'package:memeapp/Providers/MemeProvider.dart';
import 'package:provider/provider.dart';

class InsideProfile extends StatefulWidget {
  final String name;
  // final int myIndex;
  const InsideProfile({super.key, required this.name});

  @override
  State<InsideProfile> createState() => _InsideProfileState();
}

var nameController = TextEditingController();

class _InsideProfileState extends State<InsideProfile> {
  @override
  void initState() {
    nameController.text = widget.name;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Editor'),
      content: Container(
        height: 100,
        width: 120,
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Change name here',
              ),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      // print("${widget.mylist['email']}");
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.close, color: Colors.red, size: 30)),
                IconButton(
                    onPressed: () {
                      print('NAME IS ::  ${nameController.text}');
                      Provider.of<Authprovider>(listen: false, context)
                          .user['name'] = nameController.text;

                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.check, color: Colors.green, size: 30)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
