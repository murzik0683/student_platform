import 'package:flutter/material.dart';
import 'package:platform/helpers/colors.dart';

class SocialNetworkButtonSmall extends StatelessWidget {
  final int tag;
  final String image;
  final Function fun;

  const SocialNetworkButtonSmall(
      {Key? key, required this.tag, required this.image, required this.fun})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 35,
      child: FloatingActionButton(
        heroTag: tag,
        child: Image.asset(
          image,
          width: 20,
        ),
        backgroundColor: CustomColors.whiteColor,
        onPressed: () => fun(),
      ),
    );
  }
}
