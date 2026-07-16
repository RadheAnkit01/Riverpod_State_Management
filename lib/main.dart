import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_statemanagement/api%20example/post_screen.dart';
// import 'package:riverpod_statemanagement/State%20Notifier%20provider/counter%20example/counter_provider_screen.dart';
// import 'package:riverpod_statemanagement/State%20Notifier%20provider/todo%20example/todo_screen.dart';
// import 'package:riverpod_statemanagement/favourite%20product/product_screen.dart';
// import 'package:riverpod_statemanagement/consumer_stateful_widget_screen.dart';
// import 'package:riverpod_statemanagement/future%20provider/future_provider.dart';
// import 'package:riverpod_statemanagement/stream%20provider/stream_provider_screen.dart';
// import 'package:riverpod_statemanagement/multi_state_provider.dart';
// import 'package:riverpod_statemanagement/practice.dart';
// import 'package:riverpod_statemanagement/provider.dart';
// import 'package:riverpod_statemanagement/state_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // return ProviderScope(child: MaterialApp(home: const StateProviderScreen()));
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const PostScreen(),
      ),
    );
  }
}
