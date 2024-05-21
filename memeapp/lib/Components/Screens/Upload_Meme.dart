import 'package:flutter/material.dart';
import 'package:memeapp/Resources/Resources.dart';

class Upload_Meme extends StatelessWidget {
  const Upload_Meme({super.key});

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
            Container(
              alignment: Alignment.center,
              child: Image.network(
                memeImg1,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 200,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.close, color: Colors.red),
                    SizedBox(width: 20),
                    Text('Choose Another')
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            color: Colors.black,
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
