import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_statemanagement/multi_state_provider.dart';
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
      child: MaterialApp(home: const MultiStateProviderScreen()),
    );
  }
}
