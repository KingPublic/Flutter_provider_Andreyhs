import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:global_state/global_state.dart'; // Pastikan jalur ini sesuai

class AdvancedCounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Advanced Counter App'),
      ),
      body: Consumer<GlobalState>(
        builder: (context, globalState, child) {
          return ListView.builder(
            itemCount: globalState.counters.length,
            itemBuilder: (context, index) {
              final counter = globalState.counters[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: counter.color,
                ),
                title: Text('${counter.label}: ${counter.value}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () => globalState.increment(index),
                    ),
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () => globalState.decrement(index),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<GlobalState>(context, listen: false).addCounter();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
