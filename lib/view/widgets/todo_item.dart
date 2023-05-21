import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_app/model/todo_model.dart';

class TodoItemWidget extends ConsumerWidget {
  final TodoModel todoModel;
  const TodoItemWidget({super.key, required this.todoModel});

  @override
  Widget build(BuildContext context, ref) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: const SizedBox(
          width: 10,
        ),
        minLeadingWidth: 10,
        contentPadding: const EdgeInsets.all(5),
        title: Text(todoModel.content),
      ),
    );
  }
}
