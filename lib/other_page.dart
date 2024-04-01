import 'package:flutter/material.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({super.key,});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Other'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Other counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              '0',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        )
      ),
      floatingActionButton: const Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: onPressed,
            tooltip: 'increment',
            heroTag: 'increment',    
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: onPressed,
            tooltip: 'decrement',
            heroTag: 'decrement',    
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}