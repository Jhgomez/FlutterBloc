// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_list_cubit.dart';

class TodoListState extends Equatable {
  final List<Todo> todos;

  const TodoListState({required this.todos});

  factory TodoListState.initial() {
    return TodoListState(todos: [
      Todo(id: '1', desc: 'Clean room', completed: false),
      Todo(id: '2', desc: 'wash', completed: false),
      Todo(id: '3', desc: 'Do homework', completed: false),
    ]);
  }

  @override
  List<Object> get props => [todos];

  @override
  String toString() => 'TodoListState $todos';

  TodoListState copyWith({
    List<Todo>? todos,
  }) {
    return TodoListState(
      todos: todos ?? this.todos,
    );
  }
}
