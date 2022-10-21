import 'package:flutter/material.dart';
import 'package:rickmorty/features/presentation/screens/characters_screen/characters_screen.dart';
import 'package:rickmorty/features/presentation/screens/main_screen/main_screen.dart';
import 'package:rickmorty/service_locator.dart' as di;

void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Rick and Morty',
      home: MainScreen(),
    );
  }
}
