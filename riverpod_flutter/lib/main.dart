// ignore_for_file: non_constant_identifier_names, unused_local_variable, depend_on_referenced_packages

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_flutter/homepage2.dart';
import 'package:riverpod_flutter/user.dart';

import 'logger.dart';

// -----------------------Provider-------------------------------
final counterProvider = StateProvider<int>((ref) => 0);

// -----------------------NotifierProvider-----------------------
final userProvider = StateNotifierProvider<UserNotifier, User>(
    (ref) => UserNotifier(User(name: ' ', age: 0)));
// ChangeNotifierPRovider --------- THE ONLY PROVIDER WHICH IS MUTABLE----------------------ChangeNotifierPRovider
final UserChangeNotifierProvider =
    ChangeNotifierProvider((ref) => UserNotifierChange());

// -----------------------FutureProvider-----------------------

/* final fetchUserProvider = FutureProvider((ref) {
  final UserRepository = ref.watch(userRepositoryProvider);
  return UserRepository.fetchUserData();
}); */

final fetchUserProvider =
    FutureProvider.family.autoDispose((ref, String input) {
  ref.keepAlive();
  final UserRepository = ref.watch(userRepositoryProvider);
  return UserRepository.fetchUserData(input);
});
// -----------------------StreamProvider-----------------------
final streamProvider = StreamProvider((ref) async* {
  yield [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
});

void main() {
  runApp(ProviderScope(observers: [
    LoggerRiverpod(),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage2(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    return Container();
    /* Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('State Provider'),
        actions: [
          IconButton(
              onPressed: () {
                ref.invalidate(counterProvider);
              },
              icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: Center(
        child: Text(
          count.toString(),
          style: TextStyle(fontSize: 30),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //ref.read(counterProvider.notifier).state++;
          ref.read(counterProvider.notifier).update((state) => state + 1);
        },
        child: const Icon(Icons.add),
      ),
    ); */
  }
}
