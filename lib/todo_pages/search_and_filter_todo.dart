import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/cubits/todo_cubits/todo_cubits.dart';
import 'package:flutter_bloc_app/todo_models/todo.dart';

class SearchAndFilterTodo extends StatelessWidget {
  const SearchAndFilterTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(
            labelText: 'Search todos... ',
            border: InputBorder.none,
            filled: true,
            prefixIcon: Icon(Icons.search)
          ),
          onChanged: (term) {
            context.read<TodoSearchCubit>().setSearchItem(term);
            List<Todo> todos = context.read<TodoListCubit>().state.todos;
            Filter filter = context.read<TodoFilterCubit>().state.filter;
            String searchTerm = context.read<TodoSearchCubit>().state.searchTerm;
            context.read<FilteredTodosCubit>().updateFilteredTodos(todos, filter, searchTerm);
          },
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            filterButton(context, Filter.all),
            filterButton(context, Filter.active),
            filterButton(context, Filter.comopleted),
          ],
        )
      ],
    );
  }

  Widget filterButton(BuildContext context, Filter filter) {
   return TextButton(
     onPressed: () {  
        context.read<TodoFilterCubit>().changeFilter(filter);
        context.read<FilteredTodosCubit>().updateFilteredTodos(
          context.read<TodoListCubit>().state.todos, 
          context.read<TodoFilterCubit>().state.filter, 
          context.read<TodoSearchCubit>().state.searchTerm
        );
      }, 
      child: Text(
       switch (filter) {
         Filter.all => 'All',
         Filter.active => 'Active',
         Filter.comopleted => 'Completed',
       },
       style: TextStyle(
          fontSize: 18,
          color: textColor(context, filter)
        ),
     )
    );
  }

  Color textColor(BuildContext context, Filter filter) {
    final currentFilter = context.watch<TodoFilterCubit>().state.filter;
    return currentFilter == filter ? Colors.blue : Colors.grey;
  }
}
