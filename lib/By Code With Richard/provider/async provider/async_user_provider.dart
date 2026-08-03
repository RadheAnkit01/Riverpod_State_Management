// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_statemanagement/By%20Code%20With%20Richard/model/user.dart';

part 'async_user_provider.g.dart';

//manual
final asyncUserProvider = FutureProvider.autoDispose<List<User>>((ref) async {
  await Future.delayed(Duration(seconds: 2));
  final users = const [
    User(id: 1, firstName: "Ankit", email: "ankit@gmail.com", age: 21),
    User(id: 2, firstName: "Salaih", email: "salaih@gmail.com", age: 22),
    User(id: 3, firstName: "Gopal", email: "gopal@gmail.com", age: 25),
    User(id: 4, firstName: "Shamim", email: "shamim@gmail.com", age: 20),
    User(id: 5, firstName: "Chandan", email: "chandan@gmail.com", age: 22),
    User(id: 6, firstName: "Snigdha", email: "snigdha@gmail.com", age: 23),
    User(id: 7, firstName: "Drishti", email: "drishti@gmail.com", age: 20),
  ];
  return users;
});

//using code generator tool.

@riverpod
Future<List<User>> asyncUserGenerated(AsyncUserGeneratedRef ref) async {
  await Future.delayed(Duration(seconds: 2));
  final users = const [
    User(id: 1, firstName: "Ankit", email: "ankit@gmail.com", age: 21),
    User(id: 2, firstName: "Salaih", email: "salaih@gmail.com", age: 22),
    User(id: 3, firstName: "Gopal", email: "gopal@gmail.com", age: 25),
    User(id: 4, firstName: "Shamim", email: "shamim@gmail.com", age: 20),
    User(id: 5, firstName: "Chandan", email: "chandan@gmail.com", age: 22),
    User(id: 6, firstName: "Snigdha", email: "snigdha@gmail.com", age: 23),
    User(id: 7, firstName: "Drishti", email: "drishti@gmail.com", age: 20),
  ];
  return users;
}
