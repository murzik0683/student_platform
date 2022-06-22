import 'package:flutter/material.dart';
import 'package:platform/helpers/colors.dart';

class SocialNetworkButtonBig extends StatelessWidget {
  final int tag;
  final String image;
  final Function fun;

  const SocialNetworkButtonBig(
      {Key? key, required this.tag, required this.image, required this.fun})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: FloatingActionButton(
        heroTag: tag,
        child: Image.asset(
          image,
          width: 25,
        ),
        backgroundColor: CustomColors.whiteColor,
        onPressed: () => fun(),
      ),
    );
  }
}
