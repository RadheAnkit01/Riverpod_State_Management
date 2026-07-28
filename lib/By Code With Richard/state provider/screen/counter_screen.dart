import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_statemanagement/By%20Code%20With%20Richard/provider/counter_provider.dart';

class CounterScreenRichard extends ConsumerWidget {
  const CounterScreenRichard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProviderRichard);
    final counterNotifier = ref.read(counterProviderRichard.notifier);
    return Scaffold(
      body: Center(child: Text("Current count : $counter")),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              counterNotifier.state++;
            },
            child: Text("+"),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              counterNotifier.state--;
            },
            child: Text("-"),
          ),
        ],
      ),
    );
  }
}
