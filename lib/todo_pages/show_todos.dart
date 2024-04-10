import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/cubits/todo_cubits/filtered_todos/filtered_todos_cubit.dart';


class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    final todos = context.watch<FilteredTodosCubit>().state.todos;
    return ListView.separated(
      primary: false,
      shrinkWrap: true,
      itemBuilder: ((context, index) {
        return Dismissible(
            key: ValueKey(todos[index].id),
            background: showBackground(0),
            secondaryBackground: showBackground(1),
            child: Text(
              todos[index].desc,
              style: const TextStyle(fontSize: 20)
            ),
            onDismissed: (todo) {

            },
          );
        }
      ),
      separatorBuilder: ((context, index) {
        return const Divider(color: Colors.grey);
       }
      ),
      itemCount: todos.length
    );
  }

  Widget showBackground(int direction) {
    return Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.symmetric(10),
      color: Colors.red,
      alignment: direction == 0 ? Alignment.centerLeft : Alignment.centerRight,
      child: const Icon(
        Icons.delete,
        size: 30,
        color: Colors.white,
      ),
    )
  }
}