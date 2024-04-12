// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'filtered_todos_bloc.dart';

abstract class FilteredTodosEvent extends Equatable {

  const FilteredTodosEvent();

  @override
  List<Object> get props => [];
}

class UpdateFilteredListEvent extends FilteredTodosEvent {
  final List<Todo> todos;
  final Filter filter;
  final String searchTerm;

  const UpdateFilteredListEvent({required this.todos, required this.filter, required this.searchTerm,});

  @override
  List<Object> get props => [todos, filter, searchTerm];

  @override
  String toString() => 'FilteredTodosState $todos $filter $searchTerm';
}