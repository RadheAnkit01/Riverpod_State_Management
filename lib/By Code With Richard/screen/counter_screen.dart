import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_statemanagement/By%20Code%20With%20Richard/provider/async%20notifier%20provider/counter_async_provider.dart';

class CounterScreenRichard extends ConsumerWidget {
  const CounterScreenRichard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final counter = ref.watch(counterProviderRichard);
    // final counter = ref.watch(counterNotifierProviderRichard);
    final counter = ref.watch(counterAsyncNotifierProvider);
    // final counterNotifier = ref.read(counterProviderRichard.notifier);
    // final counterNotifier = ref.read(counterNotifierProviderRichard.notifier);
    final counterNotifier = ref.read(counterAsyncNotifierProvider.notifier);
    return Scaffold(
      body: Center(
        child: counter.when(
          data: (data) => Text("Current count : $data"),
          error: (error, stackTrace) => Text("Current count : $error"),
          loading: () => CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              // counterNotifier.state++;
              counterNotifier.increment();
            },
            child: Text("+"),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              // counterNotifier.state--;
              counterNotifier.decrement();
            },
            child: Text("-"),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              // counterNotifier.state--;
              counterNotifier.reset();
            },
            child: Text("reset"),
          ),
        ],
      ),
    );
  }
}
