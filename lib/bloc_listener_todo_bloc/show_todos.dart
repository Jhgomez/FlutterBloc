import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/blocs/todo_blocs/todo_bloc.dart';
import 'package:flutter_bloc_app/todo_models/todo.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    final todos = context.watch<FilteredTodosBloc>().state.todos;
    return MultiBlocListener(
      listeners: [
        BlocListener<TodoListBloc, TodoListState>(listener: (context, state) {
          context.read<FilteredTodosBloc>().add(
            UpdateFilteredListEvent(
              todos : state.todos,
              filter : context.read<TodoFilterBloc>().state.filter,
              searchTerm : context.read<TodoSearchBloc>().state.searchTerm
            )
          );
        }),
        BlocListener<TodoFilterBloc, TodoFilterState>(listener: (context, state) {
          context.read<FilteredTodosBloc>().add(
            UpdateFilteredListEvent(
              todos: context.read<TodoListBloc>().state.todos,
              filter: state.filter,
              searchTerm: context.read<TodoSearchBloc>().state.searchTerm
            )
          );
        }),
        BlocListener<TodoSearchBloc, TodoSearchState>(listener: (context, state) {
          context.read<FilteredTodosBloc>().add(
            UpdateFilteredListEvent(
              todos: context.read<TodoListBloc>().state.todos,
              filter: context.read<TodoFilterBloc>().state.filter,
              searchTerm: state.searchTerm
            )
          );
        })
      ],
      child: ListView.separated(
        primary: false,
        shrinkWrap: true,
        itemBuilder: ((context, index) {
          return Dismissible(
            key: ValueKey(todos[index].id),
            background: showBackground(0),
            secondaryBackground: showBackground(1),
            child: TodoItem(todo: todos[index]),
            onDismissed: (_) {
              context.read<TodoListBloc>().add(RemoveTodoEvent(todo: todos[index]));
            },
            confirmDismiss: (_) {
              return showConfirmation(context);
            },
          );
        }),
        separatorBuilder: ((context, index) {
          return const Divider(color: Colors.grey);
        }),
        itemCount: todos.length
      )
    );
  }

  Widget showBackground(int direction) {
    return Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.symmetric(),
      color: Colors.red,
      alignment: direction == 0 ? Alignment.centerLeft : Alignment.centerRight,
      child: const Icon(
        Icons.delete,
        size: 30,
        color: Colors.white,
      ),
    );
  }

  Future<bool?> showConfirmation(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (dialogContext) {
          return AlertDialog(
              title: const Text('Are you sure?'),
              content: const Text('Do you really want to delete?'),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: const Text('No')),
                TextButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: const Text('Yes'))
              ]);
        });
  }
}

class TodoItem extends StatefulWidget {
  final Todo todo;
  const TodoItem({super.key, required this.todo});

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  late TextEditingController editTodo;

  @override
  void initState() {
    super.initState();
    editTodo = TextEditingController();
  }

  @override
  void dispose() {
    editTodo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext rootContext) {
    return  CheckboxListTile.adaptive(
        value: widget.todo.completed,
        onChanged: (_) {
          rootContext.read<TodoListBloc>().add(ToggleTodoEvent(todo: widget.todo));
        },
        title: Text(widget.todo.desc),
        secondary: IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              showDialog(
                  context: rootContext,
                  builder: (context) {
                    bool _error = false;
                    editTodo.text = widget.todo.desc;

                    return StatefulBuilder(builder: (context, setState) {
                      return AlertDialog(
                        title: const Text('Edit Todo'),
                        content: TextField(
                            controller: editTodo,
                            autofocus: true,
                            decoration: InputDecoration(
                                errorText:
                                    _error ? 'Value cannot be empty' : null)),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Cancel')),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  _error = editTodo.text.isEmpty;
                                });
                                if (!_error) {
                                  rootContext
                                      .read<TodoListBloc>()
                                      .add(
                                        EditTodoEvent(todo: widget.todo,desc: editTodo.text)
                                      );
                                  rootContext
                                      .read<FilteredTodosBloc>()
                                      .add(
                                        UpdateFilteredListEvent(
                                          todos: rootContext
                                              .read<TodoListBloc>()
                                              .state
                                              .todos,
                                          filter: rootContext
                                              .read<TodoFilterBloc>()
                                              .state
                                              .filter,
                                          searchTerm: rootContext
                                              .read<TodoSearchBloc>()
                                              .state
                                              .searchTerm)  
                                      );
                                  Navigator.pop(context);
                                }
                              },
                              child: const Text('Edit'))
                        ],
                      );
                    });
                  });
            }),
        // subtitle: const Text('Subtitle'),
        activeColor: Colors.blue,
      );
  }
}
