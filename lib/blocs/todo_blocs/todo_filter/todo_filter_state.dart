// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_filter_cubit.dart';

//extend equatable if you want to rebuild UI for same state and if you don't want that, then to use it so
//it will not refresh if same state is emttied again
class TodoFilterState extends Equatable {
  final Filter filter;
  
  const TodoFilterState({required this.filter});

  factory TodoFilterState.initial() {
    return const TodoFilterState(filter: Filter.all);
  }

  @override
  List<Object> get props => [filter];
  
  TodoFilterState copyWith({
    Filter? filter,
  }) {
    return TodoFilterState(
      filter: filter ?? this.filter,
    );
  }
}

