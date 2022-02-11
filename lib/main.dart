import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:star_wars_app/controllers/controller.dart';
import 'package:star_wars_app/pages/home/home.dart';

import 'pages/edit_avatar/edit_avatar.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Controller()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Star Wars App',
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
      initialRoute: "/",
      routes: {
        "/": (context) => const Home(),
        "/edit_avatar": (context) => const EditAvatar(),
      },
    );
  }
}
