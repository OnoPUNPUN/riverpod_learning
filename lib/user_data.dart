import 'package:flutter_riverpod/flutter_riverpod.dart';

class User {
  final String name;
  final int age;

  User({required this.name, required this.age});

  // Created By Dart Data generator Plugins
  User copyWith({String? name, int? age}) {
    return User(name: name ?? this.name, age: age ?? this.age);
  }
}

class UserNotifier extends StateNotifier<User> {
  // This will let use update big things
  UserNotifier() : super(User(name: '', age: 0));

  void updateName(String newName) {
    state = state.copyWith(name: newName);
  }

  void updateAge(int newAge) {
    state = state.copyWith(age: newAge);
  }
}
