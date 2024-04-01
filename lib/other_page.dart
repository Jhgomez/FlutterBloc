import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              
            },
            tooltip: 'increment',
            heroTag: 'increment',    
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              
            },
            tooltip: 'decrement',
            heroTag: 'decrement',    
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}