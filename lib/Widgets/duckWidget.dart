import 'package:NexToyMobile/Core/Extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Duck extends StatelessWidget {
  const Duck({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: SvgPicture.asset(
        "assets/svg/rubber-duck.svg",
        color: context.theme.accentColor.withOpacity(.1),
      ),
    );
  }
}
