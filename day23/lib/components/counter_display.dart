import 'package:day23/providers/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterDisplay extends StatelessWidget {
  const CounterDisplay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Button Pressed this many times: "),
          Consumer<CounterProvider>(builder: (context, cProvider, child) {
            return Text(
              cProvider.count.toString(),
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                color: Color(cProvider.count),
              ),
            );
          }),
        ],
      ),
    );
  }
}
