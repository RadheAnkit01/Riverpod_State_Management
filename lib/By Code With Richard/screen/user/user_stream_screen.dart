import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_statemanagement/By%20Code%20With%20Richard/model/user.dart';
import 'package:riverpod_statemanagement/By%20Code%20With%20Richard/provider/stream%20provider/user_stream_provider.dart';

class UserStreamScreen extends ConsumerWidget {
  UserStreamScreen({super.key});
  final List<User> users = [];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersStream = ref.watch(userStreamManualProvider);
    // final usersStream = ref.watch(userStreamProvider);

    return Scaffold(
      backgroundColor: Colors.amber.shade200,
      appBar: AppBar(
        title: const Text("Stream Provider Example"),
        backgroundColor: Colors.blue.shade400,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: usersStream.when(
          data: (data) {
            users.add(data);
            if (users.isEmpty) {
              return const Center(child: Text("No users found"));
            }
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    leading: CircleAvatar(child: Text(user.id.toString())),
                    title: Text(user.firstName),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text(user.email), Text("Age: ${user.age}")],
                    ),
                  ),
                );
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  "Error: $error",
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
