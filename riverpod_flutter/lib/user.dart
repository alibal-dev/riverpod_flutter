import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class User {
  final String name;
  final int? age;

  User({
    required this.name,
    required this.age,
  });

  User copyWith({
    String? name,
    int? age,
  }) {
    return User(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'age': age,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      age: map['age'] as int?,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(name: $name, age: $age)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.name == name && other.age == age;
  }

  @override
  int get hashCode => name.hashCode ^ age.hashCode;
}

class UserNotifier extends StateNotifier<User> {
  UserNotifier(super.state);
  void updateAge(int a) {
    state = state.copyWith(age: a);
  }

  void updateName(String n) {
    state = state.copyWith(name: n);
  }
}

class UserNotifierChange extends ChangeNotifier {
  User user = User(name: '', age: 0);
  void updateAge(int a) {
    user = user.copyWith(age: a);
    notifyListeners();
  }

  void updateName(String n) {
    user = user.copyWith(name: n);
    notifyListeners();
  }
}

final userRepositoryProvider =
    Provider.autoDispose((ref) => UserRepository(ref));

class UserRepository {
  final Ref ref;

  UserRepository(this.ref);
  Future<User> fetchUserData(String input) {
    var url = 'https://jsonplaceholder.typicode.com/users/$input';
    return http.get(Uri.parse(url)).then((value) => User.fromJson(value.body));
  }
}
