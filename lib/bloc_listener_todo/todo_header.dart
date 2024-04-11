import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/cubits/todo_cubits/todo_cubits.dart';

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
        BlocListener<TodoListCubit, TodoListState>(
          listener: (context, state) {
            context.read<ActiveCountCubit>().updateActiveCount(state.todos);
          },
          child: Text(
            '${context.watch<ActiveCountCubit>().state.activeCount} items left',
            style: const TextStyle(fontSize: 20, color: Colors.redAccent),
          ),
        )
      ],
    );
  }
}
