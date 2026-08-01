import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_statemanagement/By%20Code%20With%20Richard/model/user.dart';
import 'package:riverpod_statemanagement/By%20Code%20With%20Richard/repository/user_repository.dart';

// final fetchUserProvider = Provider<FetchUser>((ref) {
//   final userRepository = ref.watch(userRepositoryProvider);
//   return FetchUser(userRepository);
// });

part 'fetch_user.g.dart';

@riverpod
FetchUser fetchUser(FetchUserRef ref) {
  final userRepository = ref.watch(userRepositoryProvider);
  return FetchUser(userRepository);
}

class FetchUser {
  final UserRepository userRepository;
  FetchUser(this.userRepository);
  Future<List<User>> fetchUser() async {
    await Future.delayed(Duration(seconds: 1));
    return await userRepository.fetchUsers();
  }
}
