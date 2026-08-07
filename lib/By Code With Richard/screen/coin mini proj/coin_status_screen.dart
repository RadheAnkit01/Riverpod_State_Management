import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

class CoinStatusScreen extends StatelessWidget {
  const CoinStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("coin status screen")),
      body: Scaffold(
        body: ListView.builder(
          itemCount: 50,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                child: ListTile(
                  leading: CircleAvatar(child: Text("${index + 1}")),
                  title: Text("Product no ${index + 26}"),
                ),
              ),
            );
          },
        ),
        // body: Column(
        //   children: [
        //     Center(
        //       child: ElevatedButton(
        //         onPressed: () {
        //           final productId = "prod12";
        //           context.go("coinPrice/:$productId");
        //         },
        //         child: Text("go to coin price screen"),
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
