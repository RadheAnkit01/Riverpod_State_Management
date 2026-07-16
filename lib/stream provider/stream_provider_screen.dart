import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_statemanagement/stream%20provider/fake_stream_service.dart';

final tickerProvider = StreamProvider((Ref ref) {
  final tickStream = ref.watch(timerServiceProvider);
  return tickStream.tickWithError();
});

class StreamProviderScreen extends ConsumerWidget {
  const StreamProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("Stream Provider")),
      body: Consumer(
        builder: (context, ref, child) {
          final tikcerAsync = ref.watch(tickerProvider);
          return Center(
            child: tikcerAsync.when(
              skipLoadingOnRefresh: false,
              data: (data) {
                return Text(
                  "Second : ${data.toString()}",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                );
              },
              error: (error, stk) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(error.toString()),
                    ElevatedButton(
                      onPressed: () {
                        // ignore: unused_result
                        ref.refresh(tickerProvider);
                      },
                      child: Text("retry!"),
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
