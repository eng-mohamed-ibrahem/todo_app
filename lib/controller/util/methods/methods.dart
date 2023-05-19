import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../view/screens/add_todo_dialog.dart';
import '../../provider/todo_list_provider.dart';

void removeTodoItemFromHomeList(
    {required BuildContext context,
    required WidgetRef ref,
    required int index,
    required DismissDirection direction}) {
  ref
      .read(todoProvider.notifier)
      .removeTodoItem(ref.watch(todoProvider)[index])
      .whenComplete(() {
    forceRebuild(ref: ref);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 300),
        content: direction == DismissDirection.startToEnd
            ? const Text('deleted')
            : const Text('completed'),
      ),
    );
  });
}

void forceRebuild({required WidgetRef ref}) {
  /// force rebuild
  var getNotes = ref.read(todoProvider);
  ref.refresh(todoProvider).addAll(getNotes);
}

void onPressed(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (_) {
      return const AddTodoDialog();
    },
  );
}
