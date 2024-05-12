import 'package:day23/providers/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterChanger extends StatelessWidget {
  const CounterChanger({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            onPressed: () {
              CounterProvider prov = Provider.of<CounterProvider>(
                context,
                listen: false,
              );
              prov.addCount();
            },
            child: Icon(Icons.add),
          ),
          ElevatedButton(
            onPressed: () {
              CounterProvider prov = Provider.of<CounterProvider>(
                context,
                listen: false,
              );
              prov.minus();
            },
            child: Icon(Icons.remove),
          ),
          ElevatedButton(
            onPressed: () {
              CounterProvider prov = Provider.of<CounterProvider>(
                context,
                listen: false,
              );
              prov.multiplyByTen();
            },
            child: Row(
              children: [
                Icon(Icons.close),
                Text("10"),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              CounterProvider prov = Provider.of<CounterProvider>(
                context,
                listen: false,
              );
              prov.divideByTen();
            },
            child: Row(
              children: [
                Text("/10"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
