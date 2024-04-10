import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/cubits/todo_cubits/todo_cubits.dart';
import 'package:flutter_bloc_app/todo_pages/create_todo.dart';
import 'package:flutter_bloc_app/todo_pages/search_and_filter_todo.dart';
import 'package:flutter_bloc_app/todo_pages/todo_header.dart';

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
          return const SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: Column(
                    children: [
                      TodoHeader(),
                      CreateTodo(),
                      SizedBox(height: 20),
                      SearchAndFilterTodo()
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
