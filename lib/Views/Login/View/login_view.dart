import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:NexToyMobile/Components/duck_logo_with_text.dart';
import 'package:NexToyMobile/Components/fat_button.dart';
import 'package:NexToyMobile/Components/outline_text_field.dart';
import 'package:NexToyMobile/Core/Extension/context_extension.dart';
import 'package:NexToyMobile/Core/Extension/string_extension.dart';
import 'package:NexToyMobile/Core/Navigation/navigation_service.dart';
import 'package:NexToyMobile/Views/CustomNavBar/custom_nav_bar.dart';
import 'package:NexToyMobile/Views/Register/register_view.dart';
import 'package:NexToyMobile/Core/Model/User/userModel.dart';
import 'package:http/http.dart' as http;
import 'package:NexToyMobile/Components/globals.dart' as global;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaf = GlobalKey<ScaffoldState>();
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;
  String _email = "", _password = "", status = '201';
  User activeUser;
  Map jsonBody;

  Future postData() async {
    final response = await http.post(global.baseUrl + '/api/user/signin',
        body: <String, String>{"email": _email, "password": _password});
    status = response.statusCode.toString();
    jsonBody = jsonDecode(response.body);
    //print(jsonBody);
  }

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
                  validator: (data) => data != null
                      ? (data.length >= 8 ? null : "passwordError".locale)
                      : "passwordError".locale,
                  keyboardType: TextInputType.multiline,
                  obscureText: true,
                ),
                SizedBox(
                  height: 10,
                ),
                FatButton(
                  text: "loginButton".locale,
                  onPressed: () {
                    if (_email.length > 0 || _password.length > 0) {
                      postData();
                      if (status == '200') {
                        if (_formKey.currentState.validate()) {
                          print("$_email $_password");
                          final aUser = User.fromJson(jsonBody);
                          global.activeUser = aUser;
                          NavigatorService().navigateToReplace(CustomNavBar());
                        } else {
                          setState(() {
                            _autoValidate = AutovalidateMode.always;
                          });
                        }
                      } else {
                        _scaf.currentState.showSnackBar(
                            SnackBar(content: Text("loginFail".locale)));
                      }
                    } else {
                      _scaf.currentState.showSnackBar(
                          SnackBar(content: Text("fieldsEmpty".locale)));
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
        onTap: () {
          NavigatorService().navigateTo(Register());
        },
        child: Text(
          "registerText".locale,
          style: context.textTheme.subtitle2,
        ),
      ),
    ));
  }
}
