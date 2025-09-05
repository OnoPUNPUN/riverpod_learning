import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod_learning/main.dart';
import 'package:river_pod_learning/user_data.dart';

/*--------------This is for StateFull Widget/Screen-------------------*/
// class HomeScreen extends ConsumerStatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   ConsumerState<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends ConsumerState<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final name = ref.watch(nameProvider);
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [Text(name)],
//         ),
//       ),
//     );
//   }
// }

/*--------------This is for Stateless Widget/Screen-------------------*/
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  void onSubmitted(String name, WidgetRef ref) {
    //ref.read(changeNameProvider.notifier).update((state) => name); // This will update the value dynamically
      ref.read(userProvider.notifier).updateName(name);
  }

  void onSubmittedAge(String age, WidgetRef ref) {
    ref.read(userProvider.notifier).updateAge(int.parse(age));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider); // Now This will rerun the app whenever a data change if name change it will rerun
    /* This will rerun for only singel value from class Means we can change only one value from the class*/
    final userSelect = ref.watch(userProvider.select((value) => value.name));
    final name = ref.watch(nameProvider); // this will continuously check if there anything change
    final nameRead = ref.read(nameProvider); // this is one time it will check one time and stop
    final changName = ref.watch(changeNameProvider) ?? '';
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Name'
            ),
            onSubmitted: (value) => onSubmitted(value, ref)
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Age'
            ),
              onSubmitted: (value) => onSubmittedAge(value, ref)
          ),
          const SizedBox(height: 40,),
          Text(user.age.toString()),
        ],
      ),
    );
  }
}
