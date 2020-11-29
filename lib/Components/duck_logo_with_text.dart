import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Core/Extension/context_extension.dart';

class DuckLogoWithText extends StatelessWidget {
  const DuckLogoWithText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: context.height / 5,
          width: context.height / 5,
          child: SvgPicture.asset(
            "assets/svg/rubber-duck.svg",
            color: context.theme.primaryColor,
          ),
        ),
        Text(
          "NexToy",
          style: context.textTheme.headline3.copyWith(
            color: context.theme.primaryColor,
            fontSize: 44,
          ),
        ),
      ],
    );
  }
}
