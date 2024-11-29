import 'package:flutter/material.dart';

class LocalCounterWidget extends StatefulWidget {
  @override
  _LocalCounterWidgetState createState() => _LocalCounterWidgetState();
}

class _LocalCounterWidgetState extends State<LocalCounterWidget> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  void _decrement() {
    setState(() {
      if (_counter > 0) _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Local Counter: $_counter', style: TextStyle(fontSize: 24)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: _increment, child: Text('Increment')),
            SizedBox(width: 10),
            ElevatedButton(onPressed: _decrement, child: Text('Decrement')),
          ],
        ),
      ],
    );
  }
}
