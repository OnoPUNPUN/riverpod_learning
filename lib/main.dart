import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod_learning/home_screen.dart';

/*If I want to change  the value the value won't change if I use Provider*/
final nameProvider = Provider<String>((ref) => "You can't change me");
final changeNameProvider = StateProvider<String?>((ref) => null);

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
