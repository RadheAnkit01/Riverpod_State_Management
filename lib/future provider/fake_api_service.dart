import 'dart:math';

class FakeApiService {
  Future<String> fetchGreeting(String name) async {
    await Future.delayed(const Duration(seconds: 2));
    if (Random().nextDouble() < 0.5) {
      throw Exception("Failed to fetch greeting");
    } else {
      return "Hello $name";
    }
  }
}
