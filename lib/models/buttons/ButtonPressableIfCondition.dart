import 'package:flutter/material.dart';

class ButtonPressableIfCondition extends StatelessWidget {
  final bool? isDark;
  final bool Function() condition;
  final Widget childIfTrue;
  final Widget childIfFalse;
  final void Function()? onTap;

  const ButtonPressableIfCondition({
    Key? key,
    this.isDark,
    required this.condition,
    required this.childIfTrue,
    required this.childIfFalse,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap != null && condition() ? () => onTap!() : null,
      child: condition() ? childIfTrue : childIfFalse,
    );
  }
}