import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_statemanagement/By%20Code%20With%20Richard/provider/auto%20dispose%20provider/user_notifer_provider.dart';

class UserScreen extends ConsumerStatefulWidget {
  const UserScreen({super.key});

  @override
  ConsumerState<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends ConsumerState<UserScreen> {
  late TextEditingController _userTextController;

  @override
  void initState() {
    super.initState();
    _userTextController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _userTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userNotiferprovider);
    final userNotifer = ref.read(userNotiferprovider.notifier);
    return Scaffold(
      appBar: AppBar(title: Text("User Screen")),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: TextField(controller: _userTextController)),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    userNotifer.update(_userTextController.text);
                    _userTextController.clear();
                  },
                  child: Text("Add User"),
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(child: Text("User : $user ")),
          ],
        ),
      ),
    );
  }
}
