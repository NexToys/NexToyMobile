import 'package:flutter/material.dart';

import '../../Components/duck_logo_with_text.dart';
import '../../Components/fat_button.dart';
import '../../Components/outline_text_field.dart';
import '../../Core/Extension/string_extension.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                OutlineTextField(
                  labelText: "password2".locale,
                  validator: (data) =>
                      data == _password ? null : "passNoMatch".locale,
                  keyboardType: TextInputType.multiline,
                  obscureText: true,
                ),
                SizedBox(
                  height: 10,
                ),
                FatButton(
                  text: "registerButton".locale,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
