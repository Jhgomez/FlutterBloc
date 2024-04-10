import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/cubits/todo_cubits/todo_cubits.dart';

class TodoHome extends StatelessWidget {
  static const routeName = '/todoHome';

  const TodoHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodoFilterCubit>(create: (context) => TodoFilterCubit()),
        BlocProvider<TodoListCubit>(create: (context) => TodoListCubit()),
        BlocProvider<TodoSearchCubit>(create: (context) => TodoSearchCubit()),
        BlocProvider<ActiveCountCubit>(create: (context) {
            int count = context.read<TodoListCubit>().state.todos.where((todo) => !todo.completed).toList().length;
            return ActiveCountCubit(count);
          }
        ),
        BlocProvider<FilteredTodosCubit>(create: (context) => FilteredTodosCubit(context.read<TodoListCubit>().state.todos)
        ),
      ],
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Center(
              child: const Text('Todos'),
            ),
          );
        }
      ),
    );
  }
}
