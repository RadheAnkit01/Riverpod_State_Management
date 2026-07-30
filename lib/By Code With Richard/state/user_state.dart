import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_statemanagement/By%20Code%20With%20Richard/model/user.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    @Default(false) bool isLodaing,
    String? error,
    @Default([]) List<User> users,
  }) = _UserState;
}
