import 'package:flutter_riverpod/flutter_riverpod.dart';

final timerServiceProvider = Provider((Ref ref) => FakeStreamService());

class FakeStreamService {
  Stream<int> tick() {
    return Stream.periodic(Duration(seconds: 1), (ct) => ct);
  }

  Stream<int> tickWithError() async* {
    for (int i = 0; i < 10; i++) {
      await Future.delayed(Duration(seconds: 1));
      yield i;
    }
    throw Exception("Timer Stopped!");
  }
}
