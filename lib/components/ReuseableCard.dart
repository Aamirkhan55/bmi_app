import 'package:flutter/material.dart';

class ReuseableCard extends StatelessWidget {
  final Color? color;
  final Widget? myChild;
  final VoidCallback? onpress;
  const ReuseableCard({
    super.key,
    this.color,
    this.myChild,
    this.onpress,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: onpress,
            child: Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(15),
            ),
            child: myChild,
              ),
          ),
        ));
  }
}
