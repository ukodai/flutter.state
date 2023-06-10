import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "theme_provider.dart";

class ThemeExample extends StatelessWidget {
  const ThemeExample({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme Example"),
      ),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
            title: const Text("Light Theme"),
            value: ThemeMode.light,
            groupValue: themeProvider.getTheme,
            onChanged: (_) => themeProvider.setTheme(ThemeMode.light),
          ),
          RadioListTile<ThemeMode>(
            title: const Text("Dark Theme"),
            value: ThemeMode.dark,
            groupValue: themeProvider.getTheme,
            onChanged: (_) => themeProvider.setTheme(ThemeMode.dark),
          ),
          RadioListTile<ThemeMode>(
            title: const Text("System Theme"),
            value: ThemeMode.system,
            groupValue: themeProvider.getTheme,
            onChanged: (_) => themeProvider.setTheme(ThemeMode.system),
          ),
          const Icon(Icons.favorite)
        ],
      ),
    );
  }
}
