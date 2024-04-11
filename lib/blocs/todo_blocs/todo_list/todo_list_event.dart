// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_list_bloc.dart';

abstract class TodoListEvent extends Equatable {

  const TodoListEvent();

  @override
  List<Object> get props => [];
}

class ToggleTodoEvent extends TodoListEvent {
  final Todo todo;

  const ToggleTodoEvent({required this.todo});

  @override
  List<Object> get props => [todo];

  @override
  String toString() => 'ToggleTodoEvent $todo';
}

class AddTodoEvent extends TodoListEvent {
  final String desc;

  const AddTodoEvent({required this.desc});

  @override
  List<Object> get props => [desc];

  @override
  String toString() => 'AddTodoEvent $desc';
}

class RemoveTodoEvent extends TodoListEvent {
  final Todo todo;

  const RemoveTodoEvent({required this.todo});

  @override
  List<Object> get props => [todo];

  @override
  String toString() => 'RemoveTodoEvent $todo';
}

class EditTodoEvent extends TodoListEvent {
  final Todo todo;
  final String desc;

  const EditTodoEvent({required this.todo, required this.desc});

  @override
  List<Object> get props => [todo];

  @override
  String toString() => 'EditTodoEvent $todo $desc';
}