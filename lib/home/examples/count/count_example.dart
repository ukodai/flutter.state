import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "count_provider.dart";

class CountExample extends StatelessWidget {
  const CountExample({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("Building UI: Count Example");
    // GUiDE: Alsways user "listed: false" in Provider
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Example"),
      ),
      body: Center(
        // GUiDE: Always use "Consumer" for updating State
        child: Consumer<CountProvider>(
          builder: (context, value, child) {
            return Text(
              value.getNumber.toString(),
              style: const TextStyle(fontSize: 35),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          countProvider.setNumber();
        },
        label: const Text("Add"),
      ),
    );
  }
}
