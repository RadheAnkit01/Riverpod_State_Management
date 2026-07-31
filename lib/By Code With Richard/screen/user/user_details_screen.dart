import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_statemanagement/By%20Code%20With%20Richard/model/user.dart';
import 'package:riverpod_statemanagement/By%20Code%20With%20Richard/view_model/users_view_model.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final users = ref.watch(
              usersProvider.select((selector) => selector.users),
            );
            if (users.isEmpty) {
              return Center(child: Text("No User Found "));
            }
            return Column(
              children: [
                Text("Id : ${users.firstOrNull?.id}"),
                Text("Name : ${users.firstOrNull?.firstName}"),
                Text("Age : ${users.firstOrNull?.age}"),
                Text("Email : ${users.firstOrNull?.email}"),
              ],
            );
          },
        ),
      ),

      floatingActionButton: Consumer(
        builder: (context, ref, child) {
          return FloatingActionButton(
            onPressed: () {
              ref
                  .read(usersProvider.notifier)
                  .addUser(
                    User(
                      id: 121,
                      firstName: "Ankit",
                      age: 21,
                      email: "ankit@.com",
                    ),
                  );
            },
            child: Text("+"),
          );
        },
      ),
    );
  }
}
