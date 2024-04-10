import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_app/todo_models/todo.dart';

part 'active_count_state.dart';

class ActiveCountCubit extends Cubit<ActiveCountState> {
  ActiveCountCubit(int count) : super(ActiveCountState(activeCount: count));

  void updateActiveCount(List<Todo> todos) {
    int activeTodos = todos.where((todo) => !todo.completed).toList().length;
    emit(state.copyWith(activeCount:  activeTodos));
  }
}
