import 'package:flutter/material.dart';

class NumberController extends StatefulWidget {
  double min;
  double max;
  double changeValueBy;
  double value;
  Function(double) onChange;

  NumberController({
    super.key,
    this.min = 0,
    required this.onChange,
    required this.max,
    this.changeValueBy = 1,
    required this.value,
  });

  @override
  State<NumberController> createState() => _NumberControllerState();
}

class _NumberControllerState extends State<NumberController> {
  late double value = widget.value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              if ((value - widget.changeValueBy) >= widget.min) {
                setState(() {
                  value = value - widget.changeValueBy;
                  widget.onChange(value);
                });
              }
            },
            icon: Icon(Icons.remove)),
        Text(
          value.toStringAsFixed(1),
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        IconButton(
            onPressed: () {
              if ((value + widget.changeValueBy) <= widget.max) {
                setState(() {
                  value = value + widget.changeValueBy;
                  widget.onChange(value);
                });
              }
            },
            icon: Icon(Icons.add)),
      ],
    );
  }
}
