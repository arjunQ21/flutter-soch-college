import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:memeapp/Providers/MemeProvider.dart';
import 'package:memeapp/Resources/Resources.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:provider/provider.dart';

// import 'package:memeapp/Resources/Resources.dart';

class Upload_New_Meme extends StatefulWidget {
  Upload_New_Meme({super.key});

  @override
  State<Upload_New_Meme> createState() => _Upload_New_MemeState();
}

class _Upload_New_MemeState extends State<Upload_New_Meme> {
  final ImagePicker picker = ImagePicker();

  XFile? pickedImage;
  TextEditingController captionController = TextEditingController();

  bool isSendingRequest = false;

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
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
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
                controller: captionController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    label: Text('description', style: TextStyle(fontSize: 16))),
              ),
              SizedBox(height: 20),
              Text('Upload meme: '),
              SizedBox(height: 10),
              Center(
                child: pickedImage != null
                    ? Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Image.file(
                              File(pickedImage!.path),
                            ),
                            // child: Image.network(
                            //   memeImg1,
                            //   height: 300,
                            //   fit: BoxFit.cover,
                            // ),
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
                                  InkWell(
                                      onTap: () {
                                        pickedImage = null;
                                        setState(() {});
                                      },
                                      child:
                                          Icon(Icons.close, color: Colors.red)),
                                  SizedBox(width: 20),
                                  InkWell(
                                    onTap: () async {
                                      pickedImage = await picker.pickImage(
                                          source: ImageSource.gallery);
                                      setState(() {});
                                    },
                                    child: Text('Choose Another'),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    : InkWell(
                        onTap: () async {
                          pickedImage = await picker.pickImage(
                            source: ImageSource.gallery,
                          );
                          setState(() {});
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width * 0.7,
                          decoration: BoxDecoration(
                              border: Border.all(style: BorderStyle.solid)),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.save_as,
                                  size: 40,
                                  color: Colors.blue,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            color: pickedImage == null ? Colors.grey : Colors.black,
            child: TextButton(
              onPressed: pickedImage == null
                  ? null
                  : () async {
                      try {
                        setState(() {
                          isSendingRequest = true;
                        });
                        String enteredCaption = captionController.text;
                        // creating headers
                        Map<String, String> headers = {
                          "Authorization": "Bearer ${MemeProvider.header}"
                        };
                        // creating request
                        var request = http.MultipartRequest(
                          "POST",
                          Uri.parse("$myIP/memes"),
                        );
                        // setting headers
                        request.headers.addAll(headers);
                        // putting caption in request
                        request.fields.addAll({'caption': enteredCaption});
                        // putting file in request
                        request.files.add(
                          await http.MultipartFile.fromPath(
                            "image",
                            pickedImage!.path,
                            // we need to send mime type of file also.
                            contentType: MediaType.parse(
                              lookupMimeType(pickedImage!.path)!,
                            ),
                          ),
                        );

                        var res = await request.send();
                        final resBody = await res.stream.bytesToString();
                        print(resBody);
                        if (res.statusCode == 201) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Meme Uploaded Successfully")));
                          Navigator.of(context).pop();
                          Provider.of<MemeProvider>(context, listen: false)
                              .getMemes();
                        } else {
                          throw Exception(resBody);
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(e.toString())));
                      } finally {
                        setState(() {
                          isSendingRequest = false;
                        });
                      }
                    },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'POST THIS MEME',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  if (isSendingRequest)
                    CupertinoActivityIndicator(
                      color: Colors.white,
                    )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
