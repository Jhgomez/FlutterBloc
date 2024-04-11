import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/cubits/todo_cubits/todo_cubits.dart';
import 'package:flutter_bloc_app/todo_models/todo.dart';
import 'package:flutter_bloc_app/utils/debounce.dart';

class SearchAndFilterTodo extends StatelessWidget {
  SearchAndFilterTodo({super.key});

  late final Debounce _debounce = Debounce(milliseconds: 600);

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
            _debounce.run(() {
              context.read<TodoSearchCubit>().setSearchItem(term);
             });
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
