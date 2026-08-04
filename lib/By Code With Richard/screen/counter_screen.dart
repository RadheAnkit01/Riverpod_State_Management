import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_statemanagement/By%20Code%20With%20Richard/provider/async%20notifier%20provider/counter_async_provider.dart';
// import 'package:riverpod_statemanagement/By%20Code%20With%20Richard/screen/user/future_user_list_screen.dart';
// import 'package:riverpod_statemanagement/By%20Code%20With%20Richard/screen/user/user_details_screen.dart';
// import 'package:riverpod_statemanagement/By%20Code%20With%20Richard/screen/user/add_user_screen.dart';
// import 'package:riverpod_statemanagement/By%20Code%20With%20Richard/screen/user/user_list_screen.dart';
// import 'package:riverpod_statemanagement/By%20Code%20With%20Richard/screen/user/user_stream_screen.dart';
// import 'package:riverpod_statemanagement/By%20Code%20With%20Richard/screen/user_screen.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: counter.when(
              data: (data) => Text("Current count : $data"),
              error: (error, stackTrace) => Text("Current count : $error"),
              loading: () => CircularProgressIndicator(),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red[100]),
            onPressed: () {
              context.go("userScreen");
            },
            child: Text("User Screen"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red[100]),
            onPressed: () {
              context.go("userListScreen");
            },
            child: Text("User List Screen"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red[100]),
            onPressed: () {
              context.go("userDetailScreen");
            },
            child: Text("Show first User, Consumer Widget Example"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red[100]),
            onPressed: () {
              context.go("futureUserListScreen");
            },
            child: Text("Future List, async provider"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red[100]),
            onPressed: () {
              context.go("userStreamScreen");
            },
            child: Text("Stream of user, stream provider"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red[100]),
            onPressed: () {
              context.go("coinStatus");
            },
            child: Text("Coin mini project, coin status screen"),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            heroTag: "increment",
            onPressed: () {
              // counterNotifier.state++;
              counterNotifier.increment();
            },
            child: Text("+"),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            heroTag: "decrement",
            onPressed: () {
              // counterNotifier.state--;
              counterNotifier.decrement();
            },
            child: Text("-"),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            heroTag: "reset",
            onPressed: () {
              // counterNotifier.state--;
              counterNotifier.reset();
            },
            child: Text("reset"),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            heroTag: "error",
            onPressed: () {
              // counterNotifier.state--;
              counterNotifier.error();
            },
            child: Text("error"),
          ),
        ],
      ),
    );
  }
}
