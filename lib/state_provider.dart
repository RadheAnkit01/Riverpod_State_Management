import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counter = StateProvider<int>((ref) {
  return 0;
});
final switchProvider = StateProvider<bool>((ref) {
  return false;
});

// with StatelessWidget

// class StateProviderScreen extends ConsumerWidget {
//   const StateProviderScreen({super.key});
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // final count = ref.watch(counter);
//     return Scaffold(
//       appBar: AppBar(title: Text("State Provider Stateless")),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           // //don't use this - it w
//           // Center(
//           //   child: Text(
//           //     count.toString(),
//           //     style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//           //   ),
//           // ),
//           Consumer(
//             builder: (context, ref, child) {
//               final count = ref.watch(counter);
//               print('build 1');
//               return Center(
//                 child: Text(
//                   count.toString(),
//                   style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//                 ),
//               );
//             },
//           ),
//           Consumer(
//             builder: (context, ref, child) {
//               final switchVal = ref.watch(switchProvider);
//               print("build 2");
//               return Switch(
//                 value: switchVal,
//                 onChanged: (val) {
//                   ref.read(switchProvider.notifier).state = val;
//                 },
//               );
//             },
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   ref.read(counter.notifier).state++;
//                 },
//                 child: Text("+"),
//               ),
//               SizedBox(width: 10),
//               ElevatedButton(
//                 onPressed: () {
//                   ref.read(counter.notifier).state--;
//                 },
//                 child: Text("-"),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// with statefullwidget

class StateProviderScreen extends ConsumerStatefulWidget {
  const StateProviderScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _StateProviderScreenState();
  }
}

class _StateProviderScreenState extends ConsumerState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("State Provider Stateless")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // //don't use this - it w
          // Center(
          //   child: Text(
          //     count.toString(),
          //     style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          //   ),
          // ),
          Consumer(
            builder: (context, ref, child) {
              final count = ref.watch(counter);
              print('build 1');
              return Center(
                child: Text(
                  count.toString(),
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              );
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              final switchVal = ref.watch(switchProvider);
              print("build 2");
              return Switch(
                value: switchVal,
                onChanged: (val) {
                  ref.read(switchProvider.notifier).state = val;
                },
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  ref.read(counter.notifier).state++;
                },
                child: Text("+"),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  ref.read(counter.notifier).state--;
                },
                child: Text("-"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
