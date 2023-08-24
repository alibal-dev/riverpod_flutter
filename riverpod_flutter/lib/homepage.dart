// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_flutter/main.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  void onSubmitName(WidgetRef ref, String value) {
    //ref.read(nameProvider.notifier).update((state) => value);
    //ref.read(userProvider.notifier).updateName(value);
    //ref.read(UserChangeNotifierProvider.notifier).updateName(value);
  }

/*   void onSubmitAge(WidgetRef ref, String value) {
    //ref.read(nameProvider.notifier).update((state) => value);
    //ref.read(userProvider.notifier).updateAge(int.parse(value));
    ref.read(UserChangeNotifierProvider.notifier).updateAge(int.parse(value));
  } */

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final name = ref.watch(nameProvider) ?? '--';
    //final user = ref.watch(userProvider);
    //final user = ref.watch(UserChangeNotifierProvider).user;
    //final user = ref.watch(fetchUserProvider);
    return ref.watch(streamProvider).when(
          data: (data) {
            return Scaffold(body: Center(child: Text(data.toString())));
          },
          error: (error, StackTrace) =>
              Scaffold(body: Center(child: Text(error.toString()))),
          loading: () => const Center(child: CircularProgressIndicator()),
        );
  }
}
/* Column(
        children: [
          TextField(
            onSubmitted: (value) => onSubmitName(ref, value),
          ),
          TextField(
            onSubmitted: (value) => onSubmitAge(ref, value),
          ),
          Center(
            child: Text(user.age.toString()),
          )
        ],
      ), */ 
      
      
        //future provider
      
      /*  return ref.watch(fetchUserProvider).when(
          data: (data) {
            return Center(
              child: Scaffold(
                  appBar: AppBar(),
                  body: Center(
                      child: Text(
                    data.name,
                    style: TextStyle(fontSize: 25),
                  ))),
            );
          },
          error: (error, StackTrace) =>
              Scaffold(body: Center(child: Text(error.toString()))),
          loading: () => Center(child: CircularProgressIndicator()),
        ); */