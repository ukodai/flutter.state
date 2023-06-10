import "package:flutter/material.dart";

import "examples/count/count_example.dart";
import "examples/favourite/favorite_example.dart";
import "examples/login/login_example.dart";
import "examples/slider/slider_example.dart";
import "examples/theme/theme_example.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Examples"),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ExampleButton(page: CountExample(), text: "Count Example"),
            ExampleButton(page: SliderExample(), text: "Slider Example"),
            ExampleButton(page: FavoriteExample(), text: "Favorite Example"),
            ExampleButton(page: ThemeExample(), text: "Theme Example"),
            ExampleButton(page: LoginExample(), text: "Login Example"),
          ],
        ),
      ),
    );
  }
}

class ExampleButton extends StatelessWidget {
  const ExampleButton({
    super.key,
    required this.page,
    required this.text,
  });
  final Widget page;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(150, 50),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => page,
            ),
          );
        },
        child: Text(text),
      ),
    );
  }
}
