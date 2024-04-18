import 'package:flutter/material.dart';

import '../components/number_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Multiplication Table"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Click on a Number to see its table.",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Wrap(
              children: [
                for (int i = 1; i <= 10; i++)
                  NumberTile(
                    numberToShow: i,
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
