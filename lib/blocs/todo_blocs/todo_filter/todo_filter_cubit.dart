import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_app/todo_models/todo.dart';

part 'todo_filter_state.dart';

class TodoFilterCubit extends Cubit<TodoFilterState> {
  TodoFilterCubit() : super(TodoFilterState.initial());

  void changeFilter(Filter filter) {
    emit(state.copyWith(filter: filter));
  }

  @override
  Future<void> close() {
    print('This method is used if we need to dispose something in the cubit when cubit ');
    return super.close();
  }
}
