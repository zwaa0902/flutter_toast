import 'package:flutter/material.dart';
import 'package:flutter_toast/flutter_toast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Toast Example'),
        ),
        body: Center(
          child: ElevatedButton(
            child: const Text('Show Toast'),
            onPressed: () {
              FlutterToast.showToast('Hello Flutter Toast!');
            },
          ),
        ),
      ),
    );
  }
}
