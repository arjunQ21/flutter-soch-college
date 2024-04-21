import 'package:flutter/material.dart';

class CustomCircle extends StatelessWidget {
  const CustomCircle({
    super.key,
    required this.circleSize,
    required this.isBGGreen,
  });

  final double circleSize;
  final bool isBGGreen;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.all(8),
      height: circleSize,
      width: circleSize,
      decoration: BoxDecoration(
        color: isBGGreen ? Colors.green : null,
        border: Border.all(width: 2, color: Colors.black),
        borderRadius: BorderRadius.circular(circleSize / 2),
      ),
    );
  }
}
