import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_app/todo_models/todo.dart';

part 'todo_filter_state.dart';
part 'todo_filter_event.dart';

class TodoFilterBloc extends Bloc<TodoFilterEvent, TodoFilterState> {
  TodoFilterBloc() : super(TodoFilterState.initial()) {
    on<TodoFilterEvent>((event, emit) {
      switch(event) {
        case ChangeFilterEvent() : emit(state.copyWith(filter: event.filter));
      }
    });
  }
}
