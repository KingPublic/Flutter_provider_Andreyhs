import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:global_state/global_state.dart';
import 'local_counter.dart'; 
import 'advance_counter.dart'; 

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => GlobalState(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Advanced Counter App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CounterSelectionPage(),
    );
  }
}

class CounterSelectionPage extends StatelessWidget {
  const CounterSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Selection'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LocalCounterWidget()),
                );
              },
              child: const Text('Use Local State'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdvancedCounterApp()),
                );
              },
              child: const Text('Use Global State'),
            ),
          ],
        ),
      ),
    );
  }
}
