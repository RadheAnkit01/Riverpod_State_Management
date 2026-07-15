import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sliderProvider = StateProvider<double>((ref) {
  return 0.0;
});

// //with consumer
// class MultiStateProviderScreen extends ConsumerWidget {
//   const MultiStateProviderScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     print("build");
//     return Scaffold(
//       appBar: AppBar(title: Text("Multiple State Provider")),
//       body: Column(
//         children: [
//           Consumer(
//             builder: (context, ref, child) {
//               final sliderVal = ref.watch(sliderProvider);
//               return Container(
//                 width: 300,
//                 height: 300,
//                 decoration: BoxDecoration(
//                   color: Colors.amber.withAlpha((sliderVal * 255).toInt()),
//                 ),
//               );
//             },
//           ),
//           Consumer(
//             builder: (context, ref, child) {
//               final sliderVal = ref.watch(sliderProvider);
//               return Slider(
//                 value: sliderVal,

//                 onChanged: (value) {
//                   ref.read(sliderProvider.notifier).state = value;
//                 },
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

//without consumer

class MultiStateProviderScreen extends ConsumerWidget {
  const MultiStateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("build");
    final sliderVal = ref.watch(sliderProvider);
    return Scaffold(
      appBar: AppBar(title: Text("Multiple State Provider")),
      body: Column(
        children: [
          Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.amber.withAlpha((sliderVal * 255).toInt()),
            ),
          ),
          Slider(
            value: sliderVal,

            onChanged: (value) {
              ref.read(sliderProvider.notifier).state = value;
            },
          ),
        ],
      ),
    );
  }
}

final multiProvider = StateProvider<AppState>((ref) {
  return AppState(slider: 0.0, showPassword: false);
});

class AppState {
  final double slider;
  final bool showPassword;

  AppState({required this.slider, required this.showPassword});

  AppState copyWith({double? slider, bool? showPassword}) {
    return AppState(
      slider: slider ?? this.slider,
      showPassword: showPassword ?? this.showPassword,
    );
  }
}
