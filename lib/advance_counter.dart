import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:global_state/global_state.dart';

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
                    IconButton(
                      icon: const Icon(Icons.color_lens),
                      onPressed: () {
                        // Ubah warna menggunakan dialog
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Select Color'),
                              content: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: Colors.primaries.map((color) {
                                  return GestureDetector(
                                    onTap: () {
                                      globalState.updateColor(index, color);
                                      Navigator.pop(context);
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: color,
                                    ),
                                  );
                                }).toList(),
                              ),
                            );
                          },
                        );
                      },
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
