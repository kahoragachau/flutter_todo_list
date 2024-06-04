import 'package:flutter/material.dart';
import 'package:todo_list/models/todo.dart';
import 'package:todo_list/todo_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final List<Todo> todos = [
    const Todo(
      title: 'Buy Milk',
      description: 'There is no milk left in the fridge',
      priority: Priority.high,
    ),

    const Todo(
      title: 'Make Bed', 
      description: 'Keep things Tidy', 
      priority: Priority.low
    ),

    const Todo(
      title: 'Pay Bills', 
      description: 'The Net Bill is due', 
      priority: Priority.urgent
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}