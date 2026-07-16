import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_statemanagement/State%20Notifier%20provider/counter%20example/counter_provider_controller.dart';

class CounterProviderScreen extends ConsumerWidget {
  const CounterProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter Provider Screen')),
      body: Consumer(
        builder: (context, ref, child) {
          final counter = ref.watch(counterProvider);
          return Center(
            child: Text(counter.toString(), style: TextStyle(fontSize: 30)),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 10,
        children: [
          FloatingActionButton(
            onPressed: () {
              ref.read(counterProvider.notifier).increment();
            },
            child: Text("+", style: TextStyle(fontSize: 35)),
          ),
          FloatingActionButton(
            onPressed: () {
              ref.read(counterProvider.notifier).decrement();
            },
            child: Text("-", style: TextStyle(fontSize: 35)),
          ),
          FloatingActionButton(
            onPressed: () {
              ref.read(counterProvider.notifier).reset();
            },
            child: Icon(Icons.restore, size: 30),
          ),
        ],
      ),
    );
  }
}
