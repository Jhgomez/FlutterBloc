import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_app/todo_models/todo.dart';

part 'filtered_todos_state.dart';

class FilteredTodosCubit extends Cubit<FilteredTodosState> {
  FilteredTodosCubit(List<Todo> todos) : super(FilteredTodosState(todos: todos));

  void updateFilteredTodos(
    List<Todo> todos,
    Filter filter,
    String searchTerm 
    ) {
      List<Todo> filteredTodos;

      switch (filter) {
        case Filter.all:
          filteredTodos = todos;
        case Filter.active:
          filteredTodos = todos.where((todo) => !todo.completed).toList();
        case Filter.comopleted:
          filteredTodos = todos.where((todo) => todo.completed).toList();
      }
      
      if (searchTerm.isNotEmpty) {
        filteredTodos = filteredTodos.where((todo) => todo.desc.contains(searchTerm)).toList();
      }

      emit(state.copyWith(todos: filteredTodos));
    }
}
