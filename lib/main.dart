import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod_learning/home_screen.dart';
import 'package:river_pod_learning/user_data.dart';
import 'package:http/http.dart' as http;

// /*If I want to change  the value the value won't change if I use Provider*/
// final nameProvider = Provider<String>(
//   (ref) => "You can't change me",
// ); // Provider
// /*But this will just update simple Data types value like string int etc but can't update complex
// * one's like map etc*/
// final changeNameProvider = StateProvider<String?>(
//   (ref) => null,
// ); // State Provider
//
// /*This is from user class It will dynamically change any types of values*/
// final userProvider = StateNotifierProvider<UserNotifier, User>(
//   (ref) => UserNotifier(),
// );
/*Future Provider IT's use to get data from API*/

final feacthUserProvider = FutureProvider((ref) {
  final UserRepository = ref.watch(userRpositoryProvider);
  return UserRepository.fetchUserData();
});

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

final userRpositoryProvider = Provider((ref) => UserRepository());

class UserRepository {
  Future<User> fetchUserData() async {
    const url = "https://jsonplaceholder.typicode.com/users/1";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to fetch user");
    }
  }
}
