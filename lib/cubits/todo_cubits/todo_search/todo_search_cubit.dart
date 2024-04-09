import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'todo_search_state.dart';

class TodoSearchCubit extends Cubit<TodoSearchState> {
  TodoSearchCubit() : super(TodoSearchState.Initial());

  void setSearchItem(String newSearchTerm) {
    emit(state.copyWith(searchTerm: newSearchTerm));
  } 
}
