import 'package:dragonballwiki/pages/splash_screen.dart';
import 'package:dragonballwiki/providers/favorites_provider.dart';
import 'package:flutter/material.dart';
import 'package:dragonballwiki/providers/preferences_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppData()),
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {    
    final appData = context.watch<AppData>();

    return MaterialApp(
      title: 'DragonBallWiki',
      theme: appData.lightTheme,
      darkTheme: appData.darkTheme,
      themeMode: appData.themeDark ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

