import 'package:flutter/material.dart';

class DismissbleWidget extends StatelessWidget {
  final void Function(DismissDirection)? onDismissed;
  final Key dismisskey;
  final Widget child;
  const DismissbleWidget(
      {super.key,
      required this.dismisskey,
      required this.child,
      this.onDismissed});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: dismisskey,
      onDismissed: onDismissed,
      direction: DismissDirection.horizontal,
      dismissThresholds: const <DismissDirection, double>{
        DismissDirection.horizontal: 0.25,
      },
      secondaryBackground: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.transparent,
                child: const Center(
                  child: Divider(
                    indent: 0,
                    endIndent: 0,
                    thickness: 2,
                    height: 5,
                  ),
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(color: Colors.green),
              width: MediaQuery.of(context).size.width * 0.25,
              child: const Center(
                  child: Text(
                "Completed",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
            ),
          ],
        ),
      ),
      background: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: [
            Container(
              decoration: const BoxDecoration(color: Colors.red),
              width: MediaQuery.of(context).size.width * 0.25,
              child: const Center(
                  child: Text(
                "Delete",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.transparent,
                child: const Center(
                  child: Divider(
                    indent: 0,
                    endIndent: 0,
                    thickness: 2,
                    height: 5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      child: child,
    );
  }
}
