import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_statemanagement/future%20provider/fake_api_service.dart';

final fakeApiProvider = Provider((_) => FakeApiService());

final greetingProvider = FutureProvider((Ref ref) async {
  final service = ref.read(fakeApiProvider);
  return await service.fetchGreeting("Ankit");
});

class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint("build called");
    return Scaffold(
      appBar: AppBar(),
      body: Consumer(
        builder: (context, ref, child) {
          final greetingAsync = ref.watch(greetingProvider);
          return Center(
            child: greetingAsync.when(
              skipLoadingOnRefresh: false,
              data: (data) {
                return Text(
                  data,
                  style: TextStyle(fontSize: 25, color: Colors.black),
                );
              },
              error: (err, stack) {
                debugPrint(err.toString());
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(err.toString(), style: TextStyle(color: Colors.red)),
                    ElevatedButton(
                      onPressed: () => ref.refresh(greetingProvider),
                      child: Text("retry"),
                    ),
                  ],
                );
              },
              loading: () {
                return CircularProgressIndicator();
              },
            ),
          );
        },
      ),
    );
  }
}
