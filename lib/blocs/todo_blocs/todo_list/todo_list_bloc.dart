import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_app/todo_models/todo.dart';

part 'todo_list_state.dart';
part 'todo_list_event.dart';

class TodoListBloc extends Bloc<TodoListEvent,TodoListState> {
  TodoListBloc() : super(TodoListState.initial()) {
    on<TodoListEvent>((event, emit) {
      var newTodos = [...state.todos];

      switch(event) {
        case AddTodoEvent() : 
          Todo newTodo = Todo(desc: event.desc);
          newTodos.add(newTodo);
          break;

        case EditTodoEvent() :
          newTodos = newTodos.map((todo) {
            if(todo.id == event.todo.id) {
              return Todo(id: event.todo.id, desc: event.desc);
            } else {
              return todo;
            }
          })
          .toList();

        case RemoveTodoEvent() :
          newTodos = newTodos.where((todo) => todo.id != event.todo.id).toList();

        case ToggleTodoEvent() :
          newTodos = newTodos.map((todo) {
            if(todo.id == event.todo.id) {
              return Todo(id: event.todo.id, desc: event.todo.desc, completed: !event.todo.completed);
            } else {
              return todo;
            }
          })
          .toList();
      }

      emit(state.copyWith(todos: newTodos));
    });
  }
}
