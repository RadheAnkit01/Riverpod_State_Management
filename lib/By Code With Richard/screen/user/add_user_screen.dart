import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_statemanagement/By%20Code%20With%20Richard/model/user.dart';
import 'package:riverpod_statemanagement/By%20Code%20With%20Richard/view_model/users_view_model.dart';

class AddUserScreen extends ConsumerStatefulWidget {
  const AddUserScreen({super.key});

  @override
  ConsumerState<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends ConsumerState<AddUserScreen> {
  late TextEditingController _idController;
  late TextEditingController _usernameController;
  late TextEditingController _ageController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _idController = TextEditingController();
    _usernameController = TextEditingController();
    _ageController = TextEditingController();
    _emailController = TextEditingController();
    _listnerManual();
  }

  @override
  void dispose() {
    super.dispose();
    _ageController.dispose();
    _emailController.dispose();
    _idController.dispose();
    _usernameController.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // _listner(); // added listen manual
    final users = ref.read(usersProvider.notifier);
    return Scaffold(
      appBar: AppBar(title: Text("Add User Screen")),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUnfocus,
              child: Column(
                children: [
                  customTextFormField(
                    hint: "Enter Id",
                    controller: _idController,
                    keyBoardType: TextInputType.number,
                  ),
                  SizedBox(height: 10),
                  customTextFormField(
                    hint: "Enter Username",
                    controller: _usernameController,
                    keyBoardType: TextInputType.text,
                  ),
                  SizedBox(height: 10),
                  customTextFormField(
                    hint: "Enter Age",
                    controller: _ageController,
                    keyBoardType: TextInputType.number,
                  ),
                  SizedBox(height: 10),
                  customTextFormField(
                    hint: "Enter Email",
                    controller: _emailController,
                    keyBoardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // print("button pressed");
                      final isValid =
                          _formKey.currentState?.validate() ?? false;
                      // print(
                      //   "form is ${isValid == true ? "valid" : "not valid"}",
                      // );
                      if (isValid) {
                        users.addUser(
                          User(
                            age: int.parse(_ageController.text),
                            firstName: _usernameController.text,
                            email: _emailController.text,
                            id: int.parse(_idController.text),
                          ),
                        );
                        // print("user added");
                      }
                    },
                    child: Text("Add user"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // print("button pressed");
                      final isValid =
                          _formKey.currentState?.validate() ?? false;
                      // print(
                      //   "form is ${isValid == true ? "valid" : "not valid"}",
                      // );
                      if (isValid) {
                        users.addUserWithError(
                          User(
                            age: int.parse(_ageController.text),
                            firstName: _usernameController.text,
                            email: _emailController.text,
                            id: int.parse(_idController.text),
                          ),
                        );
                        // print("user added");
                      }
                    },
                    child: Text("Add user with error"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customTextFormField({
    required String hint,
    TextEditingController? controller,
    TextInputType? keyBoardType,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        labelText: hint,
      ),
      validator: validator,
      keyboardType: keyBoardType,
    );
  }

  // Method 1 not recommended
  void _listner() {
    // method 1

    // ref.listen(usersProvider, (previous, next) {
    //   if (next.isAdded) {
    //     Navigator.pop(context);
    //   }

    //   if (next.error != null) {
    //     showDialog(
    //       context: context,
    //       builder: (context) {
    //         return AlertDialog(
    //           title: Text("error"),
    //           content: Center(child: Text(next.error!)),
    //         );
    //       },
    //     );
    //   }
    // });

    // method 2 recommended

    //for added
    ref.listen(usersProvider.select((state) => state.isAdded), (
      previous,
      next,
    ) {
      if (next) {
        Navigator.pop(context);
      }
    });

    //for error
    ref.listen(usersProvider.select((state) => state.error), (previous, next) {
      if (next != null) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(title: Text("error"), content: Text(next));
          },
        );
      }
    });
  }

  void _listnerManual() {
    //for added
    ref.listenManual(usersProvider.select((state) => state.isAdded), (
      previous,
      next,
    ) {
      if (next) {
        Navigator.pop(context);
      }
    });

    //for error
    ref.listenManual(usersProvider.select((state) => state.error), (
      previous,
      next,
    ) {
      if (next != null) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(title: Text("error"), content: Text(next));
          },
        );
      }
    });
  }
}
