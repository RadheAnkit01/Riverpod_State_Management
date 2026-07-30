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
    _listner();
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
                    validator: (p0) {
                      if (p0 == null || p0.length <= 3) {
                        return "Id min length should be 4";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 10),
                  customTextFormField(
                    hint: "Enter Username",
                    controller: _usernameController,
                    keyBoardType: TextInputType.text,
                    validator: (p0) {
                      if (p0 == null || p0.length <= 4) {
                        return "Id min length should be 5";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 10),
                  customTextFormField(
                    hint: "Enter Age",
                    controller: _ageController,
                    keyBoardType: TextInputType.number,
                    validator: (p0) {
                      if (p0 == null || int.parse(p0) < 18) {
                        return "Only 18 + allowed here";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 10),
                  customTextFormField(
                    hint: "Enter Email",
                    controller: _emailController,
                    keyBoardType: TextInputType.emailAddress,
                    validator: (p0) {
                      if (p0 == null ||
                          !p0.contains("@") ||
                          !p0.contains(".")) {
                        return "Enter a valid mail";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      print("button pressed");
                      final isValid =
                          _formKey.currentState?.validate() ?? false;
                      print(
                        "form is ${isValid == true ? "valid" : "not valid"}",
                      );
                      if (isValid) {
                        users.addUser(
                          User(
                            age: int.parse(_ageController.text),
                            firstName: _usernameController.text,
                            email: _emailController.text,
                            id: int.parse(_idController.text),
                          ),
                        );
                        print("user added");
                      }
                    },
                    child: Text("Add user"),
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

  void _listner() {
    ref.listen(usersProvider, (previous, next) {
      if (next.isAdded) {
        Navigator.pop(context);
      }
    });
  }
}
