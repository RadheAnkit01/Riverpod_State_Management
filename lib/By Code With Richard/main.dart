import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_statemanagement/By%20Code%20With%20Richard/route/go_router_provider.dart';

void main() {
  runApp(
    //Add provider scope to use riverpod statemanagement;
    const ProviderScope(child: MyRiverpodApp()),
  );
}

class MyRiverpodApp extends ConsumerWidget {
  const MyRiverpodApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: goRouter,
    );
  }
}
