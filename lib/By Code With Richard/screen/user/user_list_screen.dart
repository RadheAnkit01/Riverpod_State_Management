import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_statemanagement/By%20Code%20With%20Richard/screen/user/add_user_screen.dart';
import 'package:riverpod_statemanagement/By%20Code%20With%20Richard/view_model/users_view_model.dart';

class UserListScreen extends ConsumerWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(usersProvider);
    return Scaffold(
      appBar: AppBar(title: Text("User List Screen")),
      body: Center(
        child: ListView.builder(
          itemCount: users.users.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              style: ListTileStyle.drawer,
              title: Column(
                children: [
                  Text(users.users[index].id.toString()),
                  Text(users.users[index].firstName),
                  Text(users.users[index].email),
                  Text(users.users[index].age.toString()),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddUserScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
