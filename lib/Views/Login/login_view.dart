import 'package:NexToyMobile/Core/Extension/context_extension.dart';
import 'package:flutter/material.dart';

import '../../Components/duck_logo_with_text.dart';
import '../../Components/fat_button.dart';
import '../../Components/outline_text_field.dart';
import '../../Core/Extension/string_extension.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaf = GlobalKey<ScaffoldState>();
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;
  String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaf,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: _autoValidate,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                DuckLogoWithText(),
                SizedBox(
                  height: 20,
                ),
                OutlineTextField(
                  labelText: "email".locale,
                  onChanged: (data) {
                    _email = data;
                  },
                  validator: (data) =>
                      data.isValidEmail() == true ? null : "emailError".locale,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 10,
                ),
                OutlineTextField(
                  labelText: "password".locale,
                  onChanged: (data) => _password = data,
                  validator: (data) =>
                      data.length >= 6 ? null : "passwordError".locale,
                  keyboardType: TextInputType.multiline,
                  obscureText: true,
                ),
                SizedBox(
                  height: 10,
                ),
                FatButton(
                  text: "loginButton".locale,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _scaf.currentState.showSnackBar(
                          SnackBar(content: Text("$_email $_password")));
                    } else {
                      setState(() {
                        _autoValidate = AutovalidateMode.always;
                      });
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildSizedDivider(context),
                      Text("or".locale, style: context.textTheme.button),
                      buildSizedDivider(context),
                    ],
                  ),
                ),
                buildNavigateToRegisterPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox buildSizedDivider(BuildContext context) {
    return SizedBox(
      width: context.width * .35,
      child: Divider(
        color: context.theme.accentColor,
        height: 30,
      ),
    );
  }

  Center buildNavigateToRegisterPage() {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {},
        child: Text(
          "registerText".locale,
          style: context.textTheme.subtitle2,
        ),
      ),
    ));
  }
}
