import 'package:flutter/material.dart';

class EditBox extends StatefulWidget {
  final String name;
  final String phone;
  final Function(String) onNameChanged;
  final Function(String) onPhoneChanged;
  const EditBox(
      {super.key,
      required this.name,
      required this.phone,
      required this.onNameChanged,
      required this.onPhoneChanged});

  @override
  State<EditBox> createState() => _EditBoxState();
}

class _EditBoxState extends State<EditBox> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.name;
    phoneController.text = widget.phone;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Enter new details:"),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Name',
              ),
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                hintText: 'phone',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                widget.onNameChanged(nameController.text);
                widget.onPhoneChanged(phoneController.text);
                Navigator.of(context).pop();
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    'Save',
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
