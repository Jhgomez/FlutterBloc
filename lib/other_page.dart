import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/blocs/counter/counter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (context) => CounterBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Other'),
        ),
        body: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${context.watch<CounterBloc>().state.counter}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              '0',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        )),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                BlocProvider.of<CounterBloc>(context).add(IncrementCounterEvent());
              },
              tooltip: 'increment',
              heroTag: 'increment',
              child: const Icon(Icons.add),
            ),
            const SizedBox(width: 10),
            FloatingActionButton(
              onPressed: () {
                context.read<CounterBloc>().add(DecrementCounterEvent());
              },
              tooltip: 'decrement',
              heroTag: 'decrement',
              child: const Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
