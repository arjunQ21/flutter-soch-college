import 'package:flutter/material.dart';
// import 'package:memeapp/Resources/Resources.dart';

class Upload_New_Meme extends StatelessWidget {
  const Upload_New_Meme({super.key});

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
          'MemeFlow',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
        actions: [
          Container(
              margin: EdgeInsets.only(right: 20),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(20)),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.person,
                    color: Colors.white,
                  ))),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Post a new meme',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text('Caption the Meme'),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(10)),

                  // hintText: "Helloo ji",
                  label: Text('description', style: TextStyle(fontSize: 16))),
            ),
            SizedBox(height: 20),
            Text('Upload meme: '),
            SizedBox(height: 10),
            Center(
              child: Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.7,
                decoration:
                    BoxDecoration(border: Border.all(style: BorderStyle.solid)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon:
                              Icon(Icons.save_as, size: 40, color: Colors.blue))
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey,
            child: TextButton(
                onPressed: () {},
                child: Text(
                  'POST THIS MEME',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
          )
        ],
      ),
    );
  }
}
