import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/cubits/todo_cubits/todo_cubits.dart';
import 'package:flutter_bloc_app/todo_models/todo.dart';


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
            child: TodoItem(todo: todos[index]),
            onDismissed: (_) {
              context.read<TodoListCubit>().removeTodo(todos[index]);
              context.read<ActiveCountCubit>().updateActiveCount(context.read<TodoListCubit>().state.todos);
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
      padding: const EdgeInsets.symmetric(),
      color: Colors.red,
      alignment: direction == 0 ? Alignment.centerLeft : Alignment.centerRight,
      child: const Icon(
        Icons.delete,
        size: 30,
        color: Colors.white,
      ),
    );
  }
}

class TodoItem extends StatefulWidget {
  final Todo todo;
  const TodoItem({super.key, required this.todo});

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile.adaptive(
      value: widget.todo.completed,
      onChanged: (_) {
        context.read<TodoListCubit>().toggleTodo(widget.todo.id);
        context.read<ActiveCountCubit>().updateActiveCount(context.read<TodoListCubit>().state.todos);
        context.read<FilteredTodosCubit>().updateFilteredTodos(
          context.read<TodoListCubit>().state.todos, 
          context.read<TodoFilterCubit>().state.filter, 
          context.read<TodoSearchCubit>().state.searchTerm
        );
      },
      title: Text(widget.todo.desc),
      // subtitle: const Text('Subtitle'),
      activeColor: Colors.blue,
    );
  }
}