import "package:flutter/material.dart";

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GalleryPage(),
    ),
  );
}

class GalleryPage extends StatelessWidget {
  const GalleryPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // print("Width" + MediaQuery.of(context).size.width.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text("Gallery"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            for (int i = 0; i < 10; i++) ImageRow(),
          ],
        ),
      ),
    );
  }
}

class ImageRow extends StatelessWidget {
  const ImageRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ImageTile(),
          ImageTile(),
          ImageTile(),
        ],
      ),
    );
  }
}

class ImageTile extends StatelessWidget {
  const ImageTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width / 3.5,
      width: MediaQuery.of(context).size.width / 3.5,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 54, 57, 244),
        image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQw4UeEjjERyEVTOIaXIKHlj7snPZAKulH5-z1Kau1lsw&s")),
      ),
      // child: Image.network(
      // "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQw4UeEjjERyEVTOIaXIKHlj7snPZAKulH5-z1Kau1lsw&s"),
    );
  }
}
