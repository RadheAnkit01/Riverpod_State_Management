import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_statemanagement/By%20Code%20With%20Richard/provider/family%20provider/user_list_provider.dart';
import 'package:riverpod_statemanagement/By%20Code%20With%20Richard/screen/user/add_user_screen.dart';
import 'package:riverpod_statemanagement/By%20Code%20With%20Richard/view_model/users_view_model.dart';

class UserListScreen extends ConsumerStatefulWidget {
  const UserListScreen({super.key});

  @override
  ConsumerState<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends ConsumerState<UserListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(usersViewModelProvider.notifier).fetchUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    //for this, it will rebuild also when error occur but it should not rebuild.
    // final users = ref.watch(usersProvider);
    //studyuk.online
    //to rebuild only when list changed not when other state changed.
    final users = ref.watch(
      usersViewModelProvider.select((selector) => selector.users),
    );
    if (kDebugMode) {
      print("build called");
    }

    // provider family passing parameter uses.
    final userWhoseId1 = ref.watch(userListProvider(1));
    if (kDebugMode) {
      print(userWhoseId1);
    }

    //provider multi arguments uses through riverpod generator .
    final userWithMultiParam = ref.watch(
      userProvider(1, 22, userName: "Ankit"),
    );
    if (kDebugMode) {
      print(userWithMultiParam);
    }

    return Scaffold(
      appBar: AppBar(title: Text("User List Screen")),
      body: Center(
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.all(1),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: Colors.blue[100],
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: ListTile(
                style: ListTileStyle.drawer,
                title: Column(
                  children: [
                    Text(users[index].id.toString()),
                    Text(users[index].firstName),
                    Text(users[index].email),
                    Text(users[index].age.toString()),
                  ],
                ),
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
