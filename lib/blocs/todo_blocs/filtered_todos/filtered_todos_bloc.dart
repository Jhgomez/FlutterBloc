import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_app/todo_models/todo.dart';

part 'filtered_todos_state.dart';
part 'filtered_todos_event.dart';

class FilteredTodosBloc extends Bloc<FilteredTodosEvent, FilteredTodosState> {
  FilteredTodosBloc(List<Todo> todos) : super(FilteredTodosState(todos: todos)) {
    on<FilteredTodosEvent>((event, emit) {
      switch (event) {
        case UpdateFilteredListEvent() : {
          List<Todo> filteredTodos;

          switch (event.filter) {
            case Filter.all:
              filteredTodos = event.todos;
            case Filter.active:
              filteredTodos = event.todos.where((todo) => !todo.completed).toList();
            case Filter.comopleted:
              filteredTodos = event.todos.where((todo) => todo.completed).toList();
          }
      
          if (event.searchTerm.isNotEmpty) {
            filteredTodos = filteredTodos.where((todo) => todo.desc.toLowerCase().contains(event.searchTerm.toLowerCase())).toList();
          }

          emit(state.copyWith(todos: filteredTodos));
        }
      }
    });
  }
}
