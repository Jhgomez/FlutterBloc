import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/blocs/todo_blocs/todo_bloc.dart';
import 'package:flutter_bloc_app/bloc_listener_todo_bloc/create_todo.dart';
import 'package:flutter_bloc_app/bloc_listener_todo_bloc/search_and_filter_todo.dart';
import 'package:flutter_bloc_app/bloc_listener_todo_bloc/show_todos.dart';
import 'package:flutter_bloc_app/bloc_listener_todo_bloc/todo_header.dart';

class ListenerTodoHomeBloc extends StatelessWidget {
  static const routeName = '/listenertodoHomebloc';

  const ListenerTodoHomeBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodoFilterBloc>(create: (context) => TodoFilterBloc()),
        BlocProvider<TodoListBloc>(create: (context) => TodoListBloc()),
        BlocProvider<TodoSearchBloc>(create: (context) => TodoSearchBloc()),
        BlocProvider<ActiveCountBloc>(create: (context) {
            int count = context.read<TodoListBloc>().state.todos.where((todo) => !todo.completed).toList().length;
            return ActiveCountBloc(count);
          }
        ),
        BlocProvider<FilteredTodosBloc>(create: (context) => FilteredTodosBloc(context.read<TodoListBloc>().state.todos)
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
                      SearchAndFilterTodo(),
                      TodoList()
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
