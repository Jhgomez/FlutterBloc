
import 'package:flutter/material.dart';

class TodoHome extends StatelessWidget {
  static const routeName = '/todoHome';

  const TodoHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: const Text('Todos'),
      ),
    );
  }
}