import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

final counter = StateProvider((ref) {
  return 0;
});

class PracticeScreen extends ConsumerWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("Practice")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer(
            builder: (context, ref, child) {
              final value = ref.watch(counter);
              return Center(
                child: Text(value.toString(), style: TextStyle(fontSize: 30)),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counter.notifier).state += 2;
        },
        child: Text('+'),
      ),
    );
  }
}
