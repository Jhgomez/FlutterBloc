import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/blocs/todo_blocs/todo_bloc.dart';

class TodoHeader extends StatelessWidget {
  const TodoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'TODO',
          style: TextStyle(fontSize: 40),
        ),
        BlocListener<TodoListBloc, TodoListState>(
          listener: (context, state) {
            context.read<ActiveCountBloc>().add(UpdateCountEvent(todos: state.todos));
          },
          child: Text(
            '${context.watch<ActiveCountBloc>().state.activeCount} items left',
            style: const TextStyle(fontSize: 20, color: Colors.redAccent),
          ),
        )
      ],
    );
  }
}
