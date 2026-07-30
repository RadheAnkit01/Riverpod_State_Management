import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_statemanagement/By%20Code%20With%20Richard/state/user_state.dart';

final usersProvider = NotifierProvider<UsersViewModel, UserState>(
  UsersViewModel.new,
);

class UsersViewModel extends Notifier<UserState> {
  @override
  UserState build() {
    return const UserState(isLodaing: true);
  }
}
