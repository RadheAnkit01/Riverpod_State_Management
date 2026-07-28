import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterAsyncNotifierProvider =
    AsyncNotifierProvider<CounterAsyncNotifier, int>(CounterAsyncNotifier.new);

class CounterAsyncNotifier extends AsyncNotifier<int> {
  @override
  FutureOr<int> build() {
    final value = Future.delayed(Duration(seconds: 3), () {
      return 0;
    });
    return value;
  }

  Future<void> increment() async {
    //for loading states
    state = const AsyncLoading();
    //for calling apis;
    final value = await Future.delayed(
      Duration(seconds: 2),
      () => state.value ?? 0,
    );
    //saving state
    state = AsyncValue.data(value + 1);
  }

  Future<void> decrement() async {
    //for loading states
    state = const AsyncLoading();
    //for calling apis;
    final value = await Future.delayed(
      Duration(seconds: 2),
      () => state.value ?? 0,
    );
    //saving state
    state = AsyncValue.data(value - 1);
  }

  // by using guard -> error handling itself, we dont need to handle error ourself
  Future<void> reset() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      // return await Future.delayed(Duration(seconds: 3), () => 0);
      return Future.error(Exception("error"));
    });
  }
}
