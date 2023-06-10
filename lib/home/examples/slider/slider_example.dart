import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "slider_provider.dart";

class SliderExample extends StatelessWidget {
  const SliderExample({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("Building UI: Slider Example");
    final sliderProvider = Provider.of<SliderProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Slider Example"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Consumer<SliderProvider>(
                  builder: (context, value, child) {
                    return Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(
                          value.getValue,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: Consumer<SliderProvider>(
                  builder: (context, value, child) {
                    return Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(
                          value.getValue,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Consumer<SliderProvider>(
            builder: (context, value, child) {
              return Slider(
                value: sliderProvider.getValue,
                onChanged: (value) {
                  sliderProvider.setValue(value);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
