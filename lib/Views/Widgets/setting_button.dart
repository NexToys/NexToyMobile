import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../../Core/Extension/context_extension.dart';

class SettingButton extends StatelessWidget {
  final bool bigSizeBorder;
  final VoidCallback onPressed;
  final String text;
  const SettingButton({
    Key key,
    @required this.bigSizeBorder,
    @required this.onPressed,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: OutlineButton(
        onPressed: onPressed,
        highlightColor: Colors.black26,
        shape: StadiumBorder(),
        highlightedBorderColor: context.theme.backgroundColor,
        borderSide: BorderSide(
          color: context.theme.backgroundColor,
          style: BorderStyle.solid,
          width: bigSizeBorder == true ? 3.1 : 1.1,
        ),
        child: Text(
          text,
          style: context.textTheme.bodyText1
              .copyWith(color: context.theme.backgroundColor),
        ),
      ),
    );
  }
}
