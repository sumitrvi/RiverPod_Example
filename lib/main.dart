import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'counterchangenotifier.dart';

final counter = StateProvider((ref) => 0);

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RiverPod Example',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: CounterApp(),
    );
  }
}

class CounterApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(counter);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Counter Example"),
        actions: [
          IconButton(
            onPressed: () {
              ref.invalidate(counter);
            },
            icon: Icon(Icons.refresh),
            color: Colors.white,
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You can incremnet & decrement the value',
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              notifier.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
            // Spacer(flex: 0.5,),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    ref.read(counter.notifier).state++;
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: () {
                    if (ref.read(counter.notifier).state >= 1) {
                      ref.read(counter.notifier).state--;
                    }
                  },
                  tooltip: 'Decrements',
                  child: const Icon(Icons.minimize),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
