import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

part 'todo_search_state.dart';
part 'todo_search_event.dart';

class TodoSearchBloc extends Bloc<TodoSearchEvent, TodoSearchState> {
  TodoSearchBloc() : super(TodoSearchState.initial()) {
    on<TodoSearchEvent>((event, emit) {
      switch (event) {
        case UpdateTermEvent() :
          emit(state.copyWith(searchTerm: event.searchTerm));
      }
    },
    transformer: debounce(const Duration(milliseconds: 500)));
  }

  EventTransformer<UpdateTermEvent> debounce<UpdateTermEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }
}
