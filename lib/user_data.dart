import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class User {
  final String name;
  // final int age;
  final String email;

  User({required this.name, required this.email});

  User copyWith({String? name, String? email}) {
    return User(name: name ?? this.name, email: email ?? this.email);
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'email': email};
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(name: map['name'] ?? '', email: map['email'] ?? '');
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() => 'User(name: $name, email: $email)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User && other.name == name && other.email == email;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode;
}
 // Created By Dart Data generator Plugins
  // User copyWith({String? name, int? age}) {
  //   return User(name: name ?? this.name, age: age ?? this.age);
  // }


// class UserNotifier extends StateNotifier<User> {
//   // This will let use update big things
//   UserNotifier() : super(User(name: '', age: 0));
//
//   void updateName(String newName) {
//     state = state.copyWith(name: newName);
//   }
//
//   void updateAge(int newAge) {
//     state = state.copyWith(age: newAge);
//   }
// }
