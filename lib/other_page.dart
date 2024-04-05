import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/blocs/counter/counter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/blocs/theme/theme_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Other'),
      ),
      body: BlocListener<CounterBloc, CounterState>(
        listener: (context, state) {
          if (state.counter == 3) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text('counter is ${state.counter}'),
                      );
                    });
              } else if (state.counter == -1) {
                Navigator.pop(context);
              }
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Counter with bloc',
                style: Theme.of(context).textTheme.headlineMedium,
             ),
             Text(
               '${context.watch<CounterBloc>().state.counter}',
               style: Theme.of(context).textTheme.bodyMedium,
             ),
            ],
          )
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<ThemeBloc>().add(ToggleThemeEvent());
            },
            tooltip: 'toggleTheme',
            heroTag: 'toggleTheme',
            child: const Icon(Icons.brightness_6),
          ),
          const SizedBox(width: 5),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(DecrementCounterEvent());
            },
            tooltip: 'decrement',
            heroTag: 'decrement',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 5),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(IncrementCounterEvent());
            },
            tooltip: 'increment',
            heroTag: 'increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 5),
          FloatingActionButton(
            onPressed: () {
              HydratedBloc.storage.clear();
            },
            tooltip: 'deletePersistedState',
            heroTag: 'deletePersistedState',
            child: const Icon(Icons.delete_forever),
          ),
        ],
      ),
    );
  }
}
