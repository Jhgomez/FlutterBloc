// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_filter_bloc.dart';

//extend equatable if you want to rebuild UI for same state and if you don't want that, then to use it so
//it will not refresh if same state is emttied again

abstract class TodoFilterEvent extends Equatable {

  const TodoFilterEvent();

  @override
  List<Object> get props => [];
}

class ChangeFilterEvent extends TodoFilterEvent {
  final Filter filter;
  
  const ChangeFilterEvent({
    required this.filter,
  });
  
  @override
  String toString() => 'changeFilterEvent(filter: $filter)';

  @override
  List<Object> get props => [filter];
}
