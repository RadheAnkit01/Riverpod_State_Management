import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final p1 = rovider<String>((ref){return "StringDate"})
//extends consumer widget
// in build addition parameter WidgetRef

final greet = Provider<String>((ref) {
  return "Welcome";
});
final name = Provider<String>((ref) {
  return "Ankit";
});
final age = Provider<int>((ref) {
  return 22;
});

//using statefull

class ProviderScreen extends ConsumerStatefulWidget {
  const ProviderScreen({super.key});

  @override
  ConsumerState<ProviderScreen> createState() => _ProviderScreenState();
}

class _ProviderScreenState extends ConsumerState<ProviderScreen> {
  @override
  Widget build(BuildContext context) {
    final rGreet = ref.watch(greet);
    final rAge = ref.watch(age);
    final rName = ref.watch(name);

    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Text(
          "$rGreet $rName $rAge",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}


// using stateless

// class ProviderScreen extends ConsumerWidget {
//   const ProviderScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final rGreet = ref.watch(greet);
//     final rAge = ref.watch(age);
//     final rName = ref.watch(name);

//     return Scaffold(
//       appBar: AppBar(title: Text('Home')),
//       body: Center(
//         child: Text(
//           "$rGreet $rName $rAge",
//           style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }



