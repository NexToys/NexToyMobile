import 'package:flutter/material.dart';
import 'package:NexToyMobile/Components/duck_logo_with_text.dart';
import 'package:NexToyMobile/Components/fat_button.dart';
import 'package:NexToyMobile/Components/outline_text_field.dart';
import 'package:NexToyMobile/Core/Extension/string_extension.dart';
import 'package:NexToyMobile/Components/globals.dart' as global;
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaf = GlobalKey<ScaffoldState>();
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;
  String _email = "", _password = "", _name = "", _username = "", status;

  Future postData() async {
    final response = await http
        .post(global.baseUrl + '/api/user/signup', body: <String, String>{
      "name": _name,
      "username": _username,
      "email": _email,
      "password": _password,
    });
    status = response.statusCode.toString();
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
                  labelText: "name".locale,
                  onChanged: (data) {
                    _name = data;
                  },
                  validator: (data) =>
                      data.length >= 6 ? null : "nameError".locale,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 10,
                ),
                OutlineTextField(
                  labelText: "username".locale,
                  onChanged: (data) {
                    _username = data;
                  },
                  validator: (data) =>
                      data.length >= 6 ? null : "usernameError".locale,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 10,
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
                    if (_name.length > 0 ||
                        _username.length > 0 ||
                        _email.length > 0 ||
                        _password.length > 0) {
                      postData();
                      if (status == '200') {
                        if (_formKey.currentState.validate()) {
                          _scaf.currentState.showSnackBar(SnackBar(
                              content:
                                  Text("registerSucc".locale + "$_username")));
                        } else {
                          setState(() {
                            _autoValidate = AutovalidateMode.always;
                          });
                        }
                      } else {
                        _scaf.currentState.showSnackBar(
                            SnackBar(content: Text("registerFail".locale)));
                      }
                    } else {
                      _scaf.currentState.showSnackBar(
                          SnackBar(content: Text("fieldsEmpty".locale)));
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
