// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_flutter/main.dart';

class MyHomePage2 extends ConsumerStatefulWidget {
  const MyHomePage2({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyHomePage2State();
}

class _MyHomePage2State extends ConsumerState<MyHomePage2> {
  String userNo = '1';

  @override
  Widget build(BuildContext context) {
    //final name = ref.watch(nameProvider) ?? '--';
    //final user = ref.watch(userProvider);
    //final user = ref.watch(UserChangeNotifierProvider).user;
    //final user = ref.watch(fetchUserProvider);
    return ref.watch(fetchUserProvider(userNo)).when(
          data: (data) {
            return Scaffold(
                body: Center(
                    child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    onSubmitted: (value) => setState(() {
                      userNo = value;
                    }),
                  ),
                ),
                Text(data.name.toString()),
              ],
            )));
          },
          error: (error, StackTrace) =>
              Scaffold(body: Center(child: Text(error.toString()))),
          loading: () =>
              const Scaffold(body: Center(child: CircularProgressIndicator())),
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