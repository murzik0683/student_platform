import 'package:flutter/material.dart';
import 'package:platform/helpers/colors.dart';

class TextButtonBig extends StatelessWidget {
  final String title;
  final Function fun;
  const TextButtonBig({Key? key, required this.title, required this.fun})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(
          const Size(350, 55),
        ),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
        backgroundColor: MaterialStateProperty.all(ThemeColors.themeColor),
        overlayColor: MaterialStateProperty.all(CustomColors.greyColor),
      ),
      onPressed: () => fun(),
      child: Text(
        title,
        style: const TextStyle(color: CustomColors.whiteColor, fontSize: 22),
      ),
    );
  }
}
