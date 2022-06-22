import 'package:flutter/material.dart';
import 'package:platform/helpers/colors.dart';

class HolderBox extends StatelessWidget {
  final Widget child;

  const HolderBox({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: Container(
        width: 350,
        height: 45,
        decoration: BoxDecoration(
            border: Border.all(color: CustomColors.greyColor),
            borderRadius: BorderRadius.circular(15)),
        child: child,
      ),
    );
  }
}
