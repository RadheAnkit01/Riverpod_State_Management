import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final textProvider = StateProvider((ref) {
  return "Nothing to show";
});

class ConsumerStatefulWidgetScreen extends ConsumerStatefulWidget {
  const ConsumerStatefulWidgetScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidgetScreen> createState() =>
      _ConsumerStatefulWidgetScreenState();
}

class _ConsumerStatefulWidgetScreenState
    extends ConsumerState<ConsumerStatefulWidgetScreen> {
  late final TextEditingController _textEditingController;
  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _textEditingController.addListener(() {
      ref.read(textProvider.notifier).state = _textEditingController.text;
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Consumer StateFul Widget")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _textEditingController,
              decoration: InputDecoration(hint: Text('Type Here')),
            ),
          ),
          SizedBox(height: 30),
          Center(
            child: Text(
              ref.watch(textProvider),
              style: TextStyle(fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}
