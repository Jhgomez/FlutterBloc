import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_app/todo_models/todo.dart';

part 'todo_list_state.dart';

class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit() : super(TodoListState.initial());

  void addTodo(String desc) {
    final newTodo = Todo(desc: desc);
    final newTodos = [ ...state.todos, newTodo];

    emit(state.copyWith(todos: newTodos));
  }

  void editTodo(String id, String desc) {
    final newTodos = state.todos.map((todo) {
        if(todo.id == id) {
          return Todo(id: id, desc: desc, completed: todo.completed);
        } else {
          return todo;
        }
      }
    )
    .toList();

    emit(state.copyWith(todos: newTodos));
  }

  void toggleTodo(String id) {
    final newTodos = state.todos.map((todo) {
        if(todo.id == id) {
          return Todo(id: id, desc: todo.desc, completed: !todo.completed);
        } else {
          return todo;
        }
      }
    )
    .toList();

    emit(state.copyWith(todos: newTodos));
  }

  void removeTodo(String id) {
    final newTodos = state.todos.where((todo) => todo.id != id).toList();

    emit(state.copyWith(todos: newTodos));
  }
}
