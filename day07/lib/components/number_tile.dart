import 'package:flutter/material.dart';

import '../pages/second_page.dart';

class NumberTile extends StatelessWidget {
  int numberToShow;
  NumberTile({
    super.key,
    required this.numberToShow,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            // CupertinoPageRoute(
            MaterialPageRoute(
              builder: (c) => SecondPage(
                tableNumber: numberToShow,
              ),
            ),
          );
        },
        child: Text(
          numberToShow.toString(),
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}