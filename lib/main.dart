import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod_learning/home_screen.dart';
import 'package:river_pod_learning/user_data.dart';

/*If I want to change  the value the value won't change if I use Provider*/
final nameProvider = Provider<String>(
  (ref) => "You can't change me",
); // Provider
/*But this will just update simple Data types value like string int etc but can't update complex
* one's like map etc*/
final changeNameProvider = StateProvider<String?>(
  (ref) => null,
); // State Provider

/*This is from user class It will dynamically change any types of values*/
final userProvider = StateNotifierProvider<UserNotifier, User>(
  (ref) => UserNotifier(),
);

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}
