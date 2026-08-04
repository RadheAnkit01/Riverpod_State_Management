import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_statemanagement/By%20Code%20With%20Richard/model/user.dart';

part 'user_stream_provider.g.dart';

//Manual stream provider
final userStreamManualProvider = StreamProvider<User>((ref) async* {
  int count = 1;

  while (count < 100) {
    await Future.delayed(Duration(seconds: 1));
    yield User(
      id: count,
      firstName: "User $count",
      age: 20 + count % 10,
      email: "user$count@gmail.com",
    );
    count++;
  }
});

//Generated Stream Provider

@riverpod
Stream<User> userStream(UserStreamRef ref) {
  return Stream.periodic(Duration(seconds: 1), (count) {
    return User(
      id: count,
      firstName: "User $count",
      age: 20 + count % 10,
      email: "user$count@gmail.com",
    );
  });
}
