import 'package:flutter/material.dart';
import 'package:todo_list/models/todo.dart';

class TodoList extends StatefulWidget {
  const TodoList({required this.todos, super.key});

  final List<Todo> todos;

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.todos.length,
      itemBuilder: (_, index){
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: widget.todos[index.prio]
            ),
          ),
        )
      },
    );
  }
}
