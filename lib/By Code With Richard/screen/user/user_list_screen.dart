import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_statemanagement/By%20Code%20With%20Richard/screen/user/add_user_screen.dart';
import 'package:riverpod_statemanagement/By%20Code%20With%20Richard/view_model/users_view_model.dart';

class UserListScreen extends ConsumerWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //for this, it will rebuild also when error occur but it should not rebuild.
    // final users = ref.watch(usersProvider);

    //to rebuild only when list changed not when other state changed.
    final users = ref.watch(usersProvider.select((selector) => selector.users));
    print("build called");

    return Scaffold(
      appBar: AppBar(title: Text("User List Screen")),
      body: Center(
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              style: ListTileStyle.drawer,
              title: Column(
                children: [
                  Text(users[index].id.toString()),
                  Text(users[index].firstName),
                  Text(users[index].email),
                  Text(users[index].age.toString()),
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
