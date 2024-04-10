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
        return Text(
            todos[index].desc,
            style: TextStyle(fontSize: 20)
          );
        }
      ),
      separatorBuilder: ((context, index) {
        return Divider(color: Colors.grey);
       }
      ),
      itemCount: todos.length
    );
  }
}