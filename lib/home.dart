import 'package:flutter/material.dart';
import 'package:todo_list/models/todo.dart';
import 'package:todo_list/todo_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // form global Key
  final _formGlobalKey = GlobalKey<FormState>();

  // Default value for priority drop down
  Priority _selectedPriority = Priority.low;

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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
        titleTextStyle: const TextStyle(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[600],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(child: TodoList(todos: todos)),

            // Form Widget
            Form(
              key: _formGlobalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [

                  // Title Text
                  TextFormField(
                    maxLength: 20,
                    decoration: const InputDecoration(
                      label: Text("Todo Title")
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter a value for the title";
                      }
                      return null;
                    },
                  ),

                  // Description Text
                  TextFormField(
                    maxLength: 128,
                    decoration: const InputDecoration(
                      label: Text("Todo Description")
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 5) {
                        return "Enter a brief Description Longer than 5 characters though";
                      }
                      return null;
                    },
                  ),

                  // Dropdown 
                  DropdownButtonFormField(
                    value: _selectedPriority,
                    decoration: const InputDecoration(
                      label: Text("Priority of Todo")
                    ),
                    // map method returns an iterable thats the reasons we convert it into list
                    items: Priority.values.map((e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Text(e.title),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedPriority = value!;
                      });
                    },
                  ),

                  // Submit Button
                  const SizedBox(height: 20,),
                  FilledButton(
                    onPressed: () {
                      _formGlobalKey.currentState!.validate();
                    }, 
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.grey[800],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)
                      )
                    ),
                    child: const Text("Add")
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}