import 'package:flutter/material.dart';

class Counter {
  int value;
  Color color;
  String label;

  Counter({this.value = 0, this.color = Colors.blue, this.label = 'Counter'});
}

class GlobalState extends ChangeNotifier {
  final List<Counter> _counters = [];

  List<Counter> get counters => List.unmodifiable(_counters);

  void addCounter() {
    _counters.add(Counter());
    notifyListeners();
  }

  void removeCounter(int index) {
    _counters.removeAt(index);
    notifyListeners();
  }

  void increment(int index) {
    _counters[index].value++;
    notifyListeners();
  }

  void decrement(int index) {
    if (_counters[index].value > 0) {
      _counters[index].value--;
      notifyListeners();
    }
  }

  void updateColor(int index, Color color) {
    _counters[index].color = color;
    notifyListeners();
  }

  void updateLabel(int index, String label) {
    _counters[index].label = label;
    notifyListeners();
  }
}
