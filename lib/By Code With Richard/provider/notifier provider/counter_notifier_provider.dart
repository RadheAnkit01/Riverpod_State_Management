import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterNotifierProviderRichard = NotifierProvider<CounterNotifier, int>(
  CounterNotifier.new,
);

class CounterNotifier extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void increment() {
    state++;
  }

  void decrement() {
    state--;
  }

  void multiply(int val) {
    state = state * val;
  }

  void divide(int val) {
    state = (state / val).floor();
  }

  void reset() {
    state = 0;
  }
}
