import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:memeapp/Components/Dialogs/caption_Edit.dart';
import 'package:memeapp/Pages/Profile_Page.dart';
import 'package:memeapp/Pages/User_Profile.dart';
import 'package:memeapp/Providers/AuthProvider.dart';
import 'package:memeapp/Providers/MemeProvider.dart';
import 'package:memeapp/Resources/Resources.dart';
import 'package:provider/provider.dart';
import '../Components/Screens/Upload_New_Meme.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  void initState() {
    Provider.of<Authprovider>(listen: false, context).getUserFromSavedToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade700,
        leadingWidth: 40,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu, size: 30),
        ),
        title: Text(
          "Memantic",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
        actions: [
          Consumer<Authprovider>(builder: (context, aprov, child) {
            return Row(children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  aprov.user['name'] ?? 'UNKNOWN',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (c) => UserProfile()));
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(right: 20),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(Icons.person, color: Colors.white),
                ),
              ),
            ]);
          })
        ],
      ),
      body: Consumer<MemeProvider>(
        builder: (context, memeProvider, child) {
          if (memeProvider.memes.isEmpty) return CircularProgressIndicator();
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Color.fromARGB(255, 255, 254, 243),
            child: ListView.builder(
              itemCount: memeProvider.memes.length,
              itemBuilder: (context, index) {
                var meme = memeProvider.memes[index]['filePath'];
                var cap = memeProvider.memes[index]['caption'] ?? "";
                String? memeUploader =
                    memeProvider.memes[index]['uploadedBy']['imageURL'];
                return Column(
                  children: [
                    ListTile(
                      leading: InkWell(
                        onTap: () {},
                        child: ClipOval(
                          child: Image.network(
                            memeUploader ?? personImg,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (c) => Profile_Page(
                                    myUsers: memeProvider.memes[index],
                                  )));
                        },
                        child: Text(
                          memeProvider.memes[index]['uploadedBy']['name'],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      subtitle: Text(
                        DateFormat(DateFormat.YEAR_MONTH_WEEKDAY_DAY).format(
                          DateTime.parse(
                            memeProvider.memes[index]['createdAt'],
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: PopupMenuButton<String>(
                        color: Colors.amber.shade50,
                        onSelected: (String result) {
                          switch (result) {
                            case 'Delete':
                              if (memeProvider.memes[index]['uploadedBy']
                                      ['id'] ==
                                  Provider.of<Authprovider>(context,
                                          listen: false)
                                      .user['id']) {
                                memeProvider.deleteMeme(
                                    memeProvider.memes[index]['_id']);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Post deleted successfully."),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        "Unauthorized post cannot be deleted!!"),
                                  ),
                                );
                              }
                              break;
                            case 'Favorite':
                              print("CLICKED TO FAVOURITE");
                              break;
                            case 'Edit':
                              showDialog(
                                  context: context,
                                  builder: (c) =>
                                      CaptionEdit(myCap: cap, myIndex: index));

                              break;
                          }
                        },
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<String>>[
                          const PopupMenuItem<String>(
                            value: 'Delete',
                            child: ListTile(
                              leading: Icon(Icons.delete),
                              title: Text('Delete'),
                            ),
                          ),
                          const PopupMenuItem<String>(
                            value: 'Favorite',
                            child: ListTile(
                              leading: Icon(Icons.favorite),
                              title: Text('Favorite'),
                            ),
                          ),
                          const PopupMenuItem<String>(
                            value: 'Edit',
                            child: ListTile(
                              leading: Icon(Icons.edit_document),
                              title: Text('Edit caption'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Text(
                            cap,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(1, 1),
                                spreadRadius: 1,
                                blurRadius: 10,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          child: Image.network(meme),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Consumer<Authprovider>(
                        builder: (context, aProv, child) {
                          return Row(
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      memeProvider.toggleFunction(
                                          memeProvider.memes[index]['_id']);
                                    },
                                    icon: memeProvider.memes[index]['likes']
                                            .contains(aProv.user['id'])
                                        ? Icon(
                                            Icons.favorite,
                                            size: 30,
                                            color: Colors.pink,
                                          )
                                        : Icon(Icons.favorite_border, size: 30),
                                  ),
                                  Text(
                                    '${memeProvider.memes[index]['likes'].length} likes',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    Divider(color: Colors.black),
                  ],
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (c) => Upload_New_Meme()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
