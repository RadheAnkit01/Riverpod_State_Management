import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_statemanagement/By Code With Richard/provider/async provider/async_user_provider.dart';

class FutureUserListScreen extends ConsumerWidget {
  const FutureUserListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final manualUsers = ref.watch(asyncUserProvider);
    final generatedUsers = ref.watch(asyncUserGeneratedProvider);

    return Scaffold(
      backgroundColor: Colors.amber.shade200,
      appBar: AppBar(
        title: const Text("Future Provider Example"),
        backgroundColor: Colors.blue.shade400,
      ),
      body: Column(
        children: [
          Expanded(
            child: UserListSection(
              title: "Manual Provider",
              users: manualUsers,
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: UserListSection(
              title: "Generated Provider",
              users: generatedUsers,
            ),
          ),
        ],
      ),
    );
  }
}

class UserListSection extends StatelessWidget {
  const UserListSection({super.key, required this.title, required this.users});

  final String title;
  final AsyncValue<dynamic> users;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          Expanded(
            child: users.when(
              data: (data) {
                if (data.isEmpty) {
                  return const Center(child: Text("No users found"));
                }

                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final user = data[index];

                    return Card(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: ListTile(
                        leading: CircleAvatar(child: Text(user.id.toString())),
                        title: Text(user.firstName),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(user.email),
                            Text("Age: ${user.age}"),
                          ],
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
        ],
      ),
    );
  }
}
