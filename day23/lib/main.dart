import 'package:day23/providers/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/counter_changer.dart';
import 'components/counter_display.dart';

void main() {
  runApp(
    ChangeNotifierProvider<CounterProvider>(
      create: (context) => CounterProvider(),
      child: MaterialApp(
        home: CounterPage(),
      ),
    ),
  );
}

class CounterPage extends StatelessWidget {
  const CounterPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CounterDisplay(),
      floatingActionButton: CounterChanger(),
    );
  }
}
