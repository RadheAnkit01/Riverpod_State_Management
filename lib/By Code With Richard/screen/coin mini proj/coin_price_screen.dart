import 'package:flutter/material.dart';

class CoinPriceScreen extends StatelessWidget {
  const CoinPriceScreen({super.key, required this.productIds});
  final List<String> productIds;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(leading: CircleAvatar(child: Text(index.toString())));
        },
      ),
    );
  }
}
