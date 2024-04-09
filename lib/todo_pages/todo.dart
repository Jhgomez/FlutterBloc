
import 'package:flutter/material.dart';

class Todo extends StatelessWidget {
  static const routeName = '/todoHome';

  const Todo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: const Text('Todos'),
      ),
    );
  }
}