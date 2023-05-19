import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_app/controller/provider/completed_todo_provider.dart';
import '../../controller/provider/todo_list_provider.dart';
import '../../controller/util/constants/scroll_controller.dart';
import '../../controller/util/methods/methods.dart';
import '../../model/todo_model.dart';
import '../widgets/dismissible_widget.dart';
import '../widgets/todo_item.dart';

class TodoList extends ConsumerWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final List<TodoModel> list = ref.watch(todoProvider);

    return list.isEmpty
        ? const Center(
            child: Text('Todo will be displayed here'),
          )
        : ListView.builder(
            controller: ListViewController.scrollController,
            itemCount: list.length,
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) {
              return Column(children: [
                DismissbleWidget(
                  dismisskey: Key('${list[index]}'),
                  onDismissed: (direction) {
                    if (direction == DismissDirection.startToEnd) {
                      removeTodoItemFromHomeList(
                          context: context,
                          ref: ref,
                          index: index,
                          direction: direction);
                    } else {
                      // move to completed tap item
                      var item = list[index];
                      item.completed = true;
                      // delete
                      removeTodoItemFromHomeList(
                          context: context,
                          ref: ref,
                          index: index,
                          direction: direction);

                      // add to completed provider
                      ref
                          .watch(completedtTodoProvider.notifier)
                          .addTodoItem(item);
                    }
                  },
                  child: TodoItemWidget(
                    todoModel: list[index],
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.red,
                    ),
                    Icon(
                      Icons.arrow_back,
                      color: Colors.green,
                    ),
                  ],
                ),
              ]);
            },
          );
  }
}
