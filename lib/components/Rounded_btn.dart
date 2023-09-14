import 'package:flutter/material.dart';

class RoundedBtn extends StatelessWidget {
  final IconData? icon;
  final VoidCallback? onPress;
  final Color? color;
  const RoundedBtn({this.icon, this.onPress, this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      elevation: 8,
      fillColor: color,
      shape: const CircleBorder(),
      constraints: const BoxConstraints.tightFor(height: 56, width: 56),
      child: Icon(
        icon,
        size: 15,
      ),
    );
  }
}
