import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  final Widget iconData;
  final Color color;
  ContainerWidget(
      {required this.iconData, this.color=Colors.blueGrey});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 38,
      child: Center(child: iconData),
      decoration: BoxDecoration(
        border: Border.all(color: color, width: 2),
        shape: BoxShape.circle,
      ),
    );
  }
}
