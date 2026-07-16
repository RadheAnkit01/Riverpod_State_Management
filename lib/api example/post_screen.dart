import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_statemanagement/api%20example/post_model.dart';

class PostScreen extends ConsumerWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postLists = ref.watch(postProvider);
    return Scaffold(
      appBar: AppBar(title: Text("Posts List")),
      body: Column(
        children: [
          Expanded(
            child: postLists.when(
              skipLoadingOnRefresh: false,
              data: (data) {
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text(data[index].id.toString()),
                      ),
                      title: Text(
                        data[index].title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(data[index].body),
                      trailing: CircleAvatar(
                        child: Text(data[index].userId.toString()),
                      ),
                    );
                  },
                );
              },
              error: (error, stack) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Text("error : $error"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        ref.invalidate(postProvider);
                      },
                      child: Text('retry'),
                    ),
                  ],
                );
              },
              loading: () => Center(child: CircularProgressIndicator()),
            ),
          ),
        ],
      ),
    );
  }
}
