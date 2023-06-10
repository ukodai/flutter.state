import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "home/examples/count/count_provider.dart";
import "home/examples/favourite/favorite_provider.dart";
import "home/examples/login/login_provider.dart";
import "home/examples/slider/slider_provider.dart";
import "home/examples/theme/theme_provider.dart";
import "home/home_page.dart";

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => SliderProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: Provider.of<ThemeProvider>(context).getTheme,
            theme: ThemeData(brightness: Brightness.light),
            darkTheme: ThemeData(brightness: Brightness.dark),
            home: const HomePage(),
          );
        },
      ),
    ),
  );
}
