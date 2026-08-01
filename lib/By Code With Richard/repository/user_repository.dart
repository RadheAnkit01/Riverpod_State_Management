import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_statemanagement/By%20Code%20With%20Richard/model/user.dart';
// import 'package:riverpod_statemanagement/By%20Code%20With%20Richard/usecase/fetch_user.dart';

// final userRepositoryProvider = Provider.autoDispose<UserRepository>((ref) {
//   return UserRepository();
// });

part 'user_repository.g.dart';

@riverpod
UserRepository userRepository(UserRepositoryRef ref) {
  return UserRepository();
}

class UserRepository {
  Future<List<User>> fetchUsers() async {
    return const [
      User(id: 1, firstName: "Ankit", email: "ankit@gmail.com", age: 21),
      User(id: 2, firstName: "Salaih", email: "salaih@gmail.com", age: 22),
      User(id: 3, firstName: "Gopal", email: "gopal@gmail.com", age: 25),
      User(id: 4, firstName: "Shamim", email: "shamim@gmail.com", age: 20),
      User(id: 5, firstName: "Snigdha", email: "snigdha@gmail.com", age: 23),
      User(id: 6, firstName: "Chandan", email: "chandan@gmail.com", age: 22),
      User(id: 7, firstName: "Drishti", email: "drishti@gmail.com", age: 20),
    ];
  }
}
