import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../screens/home.dart';

class BottomNavigationBarWidget extends ConsumerWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return BottomNavigationBar(
      selectedFontSize: 15,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      currentIndex: ref.watch(tapIndexProvider),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          label: "Home",
          icon: Icon(
            Icons.list_alt_outlined,
          ),
        ),
        BottomNavigationBarItem(
            label: "Completed", icon: Icon(FontAwesomeIcons.squareCheck))
      ],
      onTap: (index) {
        ref.read(tapIndexProvider.notifier).update((state) => index);
      },
    );
  }
}
