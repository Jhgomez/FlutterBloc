import 'package:uuid/uuid.dart';

Uuid uuid = const Uuid();

class Todo {
  final String id;
  final String desc;
  final bool completed;

  Todo({
    String? id,
    required this.desc,
    required this.completed,
  }) : id = id ?? uuid.v4();
}
