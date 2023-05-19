import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:to_do_app/controller/provider/completed_todo_provider.dart';
import '../../controller/util/constants/scroll_controller.dart';
import '../widgets/todo_item.dart';

class CompletedTodo extends ConsumerWidget {
  const CompletedTodo({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final list = ref.watch(completedtTodoProvider);

    return list.isEmpty
        ? const Center(
            child: Text('work hard to make what to do'),
          )
        : ListView.builder(
            controller: ListViewController.scrollController,
            itemCount: list.length,
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) {
              //adding
              return ListTile(
                leading: const Icon(FontAwesomeIcons.solidSquareCheck),
                title: TodoItemWidget(
                  todoModel: list[index],
                ),
              );
            },
          );
  }
}
