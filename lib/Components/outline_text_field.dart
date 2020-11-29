import 'package:NexToyMobile/Core/Extension/context_extension.dart';
import 'package:flutter/material.dart';

class OutlineTextField extends StatelessWidget {
  final TextInputType keyboardType;
  final Function(String data) onChanged;
  final Function(String data) validator;
  final bool obscureText;
  final String labelText;

  const OutlineTextField({
    Key key,
    this.keyboardType = TextInputType.emailAddress,
    this.onChanged,
    this.validator,
    this.labelText,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      validator: validator,
      obscureText: obscureText,
      onChanged: onChanged,
      cursorColor: context.theme.accentColor,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: context.theme.accentColor),
            borderRadius: BorderRadius.circular(context.constLowValue)),
        labelStyle: context.textTheme.bodyText2
            .copyWith(color: context.theme.accentColor),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(context.constLowValue)),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: context.theme.accentColor),
            borderRadius: BorderRadius.circular(context.constLowValue)),
        labelText: labelText,
      ),
    );
  }
}
