import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_app/controller/shred_helper/shared_helper.dart';
import 'package:to_do_app/model/todo_model.dart';
import '../util/constants/key_shared.dart';

final todoProvider = StateNotifierProvider<_TodoStateNotifier, List<TodoModel>>(
    (ref) => _TodoStateNotifier([]));

class _TodoStateNotifier extends StateNotifier<List<TodoModel>> {
  _TodoStateNotifier(super.state);

  void addTodoItem(TodoModel todo) {
    state.add(todo);
    saveToShared();
    log(state.toString());
    state = [...state];
  }

  /// calling in splash screen
  Future initializeProviderState() async {
    state = SharedHelper.getListFromShared(key: KeySharedConst.todoListKey)
        .toList();
  }

  Iterable<TodoModel> completedItems() sync* {
    for (var item in state) {
      if (item.completed) {
        yield item;
      }
    }
  }

  Future removeTodoItem(TodoModel todo) async {
    state.remove(todo);
    saveToShared();
    state = [...state];
  }

  updateShared() async {
    await saveToShared();
  }

  Future<bool> saveToShared() async {
    return await SharedHelper.saveListToShared(
        key: KeySharedConst.todoListKey, values: state);
  }
}
