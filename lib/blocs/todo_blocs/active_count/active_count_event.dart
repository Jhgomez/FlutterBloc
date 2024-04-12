// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'active_count_bloc.dart';

abstract class ActiveCountEvent extends Equatable {
  const ActiveCountEvent();

  @override
  List<Object> get props => [];
}

class UpdateCountEvent extends ActiveCountEvent {
  final List<Todo> todos;
  const UpdateCountEvent({required this.todos});

  @override
  List<Object> get props => [todos];

  @override
  String toString() => 'ActiveCount $todos';
}