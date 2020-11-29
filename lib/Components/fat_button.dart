import 'package:NexToyMobile/Core/Extension/context_extension.dart';
import 'package:flutter/material.dart';

class FatButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const FatButton({Key key, this.onPressed, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(context.constLowValue))),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            text,
            style: context.textTheme.headline6,
          ),
        ),
        color: context.theme.primaryColor,
        onPressed: onPressed);
  }
}
