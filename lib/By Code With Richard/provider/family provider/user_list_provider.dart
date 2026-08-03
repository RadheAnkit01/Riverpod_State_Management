import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_statemanagement/By%20Code%20With%20Richard/model/user.dart';
part 'user_list_provider.g.dart';

// only single parameter using providerfamily

// family<returnType, parameters>
final userListProvider = Provider.autoDispose.family<User, int>((ref, id) {
  final users = const [
    User(id: 1, firstName: "Ankit", email: "ankit@gmail.com", age: 21),
    User(id: 2, firstName: "Salaih", email: "salaih@gmail.com", age: 22),
    User(id: 3, firstName: "Gopal", email: "gopal@gmail.com", age: 25),
    User(id: 4, firstName: "Shamim", email: "shamim@gmail.com", age: 20),
    User(id: 5, firstName: "Chandan", email: "chandan@gmail.com", age: 22),
    User(id: 6, firstName: "Snigdha", email: "snigdha@gmail.com", age: 23),
    User(id: 7, firstName: "Drishti", email: "drishti@gmail.com", age: 20),
  ];

  final user = users.firstWhere((user) {
    return user.id == id;
  });
  return user;
});

// multi parameter using providerfamily

@riverpod
User user(UserRef ref, int id, int age, {String? userName}) {
  if (kDebugMode) {
    print("userName : $userName");
    print("ref : $ref");
    print("id : $id");
    print("age : $age");
  }
  final users = const [
    User(id: 1, firstName: "Ankit", email: "ankit@gmail.com", age: 21),
    User(id: 2, firstName: "Salaih", email: "salaih@gmail.com", age: 22),
    User(id: 3, firstName: "Gopal", email: "gopal@gmail.com", age: 25),
    User(id: 4, firstName: "Shamim", email: "shamim@gmail.com", age: 20),
    User(id: 5, firstName: "Chandan", email: "chandan@gmail.com", age: 22),
    User(id: 6, firstName: "Snigdha", email: "snigdha@gmail.com", age: 23),
    User(id: 7, firstName: "Drishti", email: "drishti@gmail.com", age: 20),
  ];

  final user = users.firstWhere((user) {
    return user.id == id;
  });
  return user;
}
