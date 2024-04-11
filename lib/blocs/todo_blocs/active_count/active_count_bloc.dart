import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_app/todo_models/todo.dart';

part 'active_count_state.dart';
part 'active_count_event.dart';

class ActiveCountBloc extends Bloc<ActiveCountEvent, ActiveCountState> {
  ActiveCountBloc(int count) : super(ActiveCountState(activeCount: count)) {
    on<ActiveCountEvent>((event, emit) {
      switch (event) {
        case UpdateCountEvent() : 
          int activeTodos = event.todos.where((todo) => !todo.completed).toList().length;
          emit(state.copyWith(activeCount:  activeTodos));
      }
    });
  }
}
