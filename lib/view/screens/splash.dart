import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../controller/provider/completed_todo_provider.dart';
import '../../controller/provider/todo_list_provider.dart';
import '../../controller/util/assets/images.dart';
import 'home.dart';

class Splash extends ConsumerWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context, ref) {
    Future.delayed(
      const Duration(milliseconds: 500),
      () {
        ref.watch(todoProvider.notifier).initializeProviderState();
        ref.watch(completedtTodoProvider.notifier).initializeProviderState();
      },
    ).whenComplete(() {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const Home(),
          ),
          (route) => false);
    });

    return Image.asset(
      AssetImagesApp.splashImage,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.contain,
    );
  }
}
