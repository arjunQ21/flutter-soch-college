import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Providers/AuthProvider.dart';

class InsidePhone extends StatefulWidget {
  final String phone;
  const InsidePhone({super.key, required this.phone});

  @override
  State<InsidePhone> createState() => _InsidePhoneState();
}

var phoneController = TextEditingController();

class _InsidePhoneState extends State<InsidePhone> {
  @override
  void initState() {
    phoneController.text = widget.phone;
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
              controller: phoneController,
              decoration: InputDecoration(
                hintText: 'Change phone no. here',
              ),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      // print("${widget.mylist['email']}");
                    },
                    icon: Icon(Icons.close, color: Colors.red, size: 30)),
                IconButton(
                    onPressed: () {
                      Provider.of<Authprovider>(listen: false, context)
                          .user['phone'] = phoneController.text;

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
