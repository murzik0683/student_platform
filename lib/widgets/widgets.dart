import 'package:flutter/material.dart';
import 'package:platform/helpers/colors.dart';

SizedBox floatButton(int tag, String image, Function fun) {
  return SizedBox(
    width: 50,
    child: FloatingActionButton(
      heroTag: tag,
      child: Image.asset(
        image,
        width: 25,
      ),
      backgroundColor: CustomColors.whiteColor,
      onPressed: ()=>fun(),
    ),
  );
}

SizedBox messengersButton(int tag, String image, fun) {
  return SizedBox(
    width: 35,
    child: FloatingActionButton(
      heroTag: tag,
      child: Image.asset(
        image,
        width: 20,
      ),
      backgroundColor: CustomColors.whiteColor,
      onPressed: fun,
    ),
  );
}

TextButton textButton(String title, fun) {
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
    onPressed: fun,
    child: Text(
      title,
      style: const TextStyle(color: CustomColors.whiteColor, fontSize: 22),
    ),
  );
}

Padding dropdownButton(Widget child) {
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
