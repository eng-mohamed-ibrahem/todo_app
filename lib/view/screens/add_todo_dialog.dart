import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../controller/provider/todo_list_provider.dart';
import '../../controller/util/constants/scroll_controller.dart';
import '../../model/todo_model.dart';

class AddTodoDialog extends HookConsumerWidget {
  const AddTodoDialog({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final GlobalKey<FormState> formState = GlobalKey<FormState>();
    final TextEditingController contentController = useTextEditingController();

    return Form(
      key: formState,
      child: AlertDialog(
        title: const Text('Add Todo'),
        content: TextFormField(
          validator: (value) {
            return value!.trim().isEmpty ? 'add todo' : null;
          },
          controller: contentController,
          autofocus: true,
          maxLines: 3,
          decoration: InputDecoration(
            hintText: "things todo",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (formState.currentState!.validate()) {
                ref.read(todoProvider.notifier).addTodoItem(
                      TodoModel(
                        content: contentController.text.trim(),
                        id: ref.read(todoProvider).length,
                      ),
                    );

                // return to home page
                Navigator.pop(context);

                /// scroll after adding to last item
                ListViewController.scrollController.animateTo(
                    ListViewController
                        .scrollController.position.maxScrollExtent,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn);
              }
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }
}
