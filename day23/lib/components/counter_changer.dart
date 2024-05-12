import 'package:day23/providers/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterChanger extends StatelessWidget {
  const CounterChanger({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        CounterProvider prov = Provider.of<CounterProvider>(
          context,
          listen: true,
        );
        prov.addCount();
      },
      child: Icon(Icons.add),
    );
  }
}
