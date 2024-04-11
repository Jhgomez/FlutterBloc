import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/cubits/todo_cubits/todo_cubits.dart';

class CreateTodo extends StatefulWidget {
  const CreateTodo({super.key});

  @override
  State<CreateTodo> createState() => _CreateTodoState();
}

class _CreateTodoState extends State<CreateTodo> {
  final TextEditingController newTodoController = TextEditingController();

  @override
  void dispose() {
    newTodoController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: newTodoController,
      decoration: const InputDecoration(labelText: 'What to do?'),
      onChanged: (term) {
        // if (term.isEmpty) return;
        // List<Todo> todos = context.read<TodoListCubit>().state.todos;
        // Filter filter = context.read<TodoFilterCubit>().state.filter; 
        // context.read<FilteredTodosCubit>().updateFilteredTodos(todos, filter, term);
        },
      onSubmitted: (desc) {
        if (desc.isEmpty) return;
        context.read<TodoListCubit>().addTodo(desc);
        // context.read<ActiveCountCubit>().updateActiveCount(context.read<TodoListCubit>().state.todos);
        newTodoController.clear();
        } ,
    );
  }
}