import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod_learning/main.dart';

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
    ref.read(changeNameProvider.notifier).update((state) => name); // This will update the value dynamically
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvider); // this will continuously check if there anything change
    final nameRead = ref.read(nameProvider); // this is one time it will check one time and stop
    final changName = ref.watch(changeNameProvider) ?? '';
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onSubmitted: (value) => onSubmitted(value, ref)
          ),
          const SizedBox(height: 40,),
          Text(changName),
        ],
      ),
    );
  }
}
