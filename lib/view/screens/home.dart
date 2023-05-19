import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:to_do_app/view/screens/todo_list.dart';
import '../../controller/provider/completed_todo_provider.dart';
import '../../controller/util/methods/methods.dart';
import '../widgets/bottom_navigation_bar.dart';
import 'completed_todo_list.dart';

final tapIndexProvider = StateProvider<int>((ref) => 0);

class Home extends ConsumerWidget {
  const Home({super.key});
  final List<Widget> taps = const [TodoList(), CompletedTodo()];
  @override
  Widget build(BuildContext context, ref) {
    int tapIndex = ref.watch(tapIndexProvider);
    return Scaffold(
      appBar: AppBar(
        title: tapIndex == 0
            ? const Text('Things ToDo')
            : const Text('Completed things'),
      ),
      body: taps[tapIndex],
      floatingActionButton: tapIndex == 0
          ? FloatingActionButton(
              onPressed: () {
                onPressed(context);
              },
              child: const Icon(FontAwesomeIcons.penToSquare),
            )
          : FloatingActionButton(
              onPressed: () {
                ref.watch(completedtTodoProvider.notifier).clearCompleted();
              },
              child: const Text('Clear'),
            ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}
