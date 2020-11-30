import 'dart:io';

import 'package:NexToyMobile/Components/fat_button.dart';
import 'package:NexToyMobile/Components/outline_text_field.dart';
import 'package:NexToyMobile/Core/Extension/context_extension.dart';
import 'package:NexToyMobile/Core/Extension/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddingToysView extends StatefulWidget {
  @override
  _AddingToysViewState createState() => _AddingToysViewState();
}

class _AddingToysViewState extends State<AddingToysView> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20),
                AspectRatio(
                  aspectRatio: 3 / 2,
                  child: InkWell(
                    onTap: () {
                      getImage();
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: _image == null
                          ? Container(
                              alignment: Alignment.center,
                              color: context.theme.primaryColor,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.add_a_photo),
                                  SizedBox(width: 20),
                                  Text("toyImage".locale)
                                ],
                              ),
                            )
                          : Image.file(_image, fit: BoxFit.fill),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                OutlineTextField(
                  keyboardType: TextInputType.text,
                  labelText: "toyName".locale,
                  validator: (data) =>
                      data.length >= 1 ? null : "nullField".locale,
                ),
                SizedBox(height: 20),
                OutlineTextField(
                  keyboardType: TextInputType.text,
                  labelText: "toyType".locale,
                  validator: (data) =>
                      data.length >= 1 ? null : "nullField".locale,
                ),
                SizedBox(height: 20),
                OutlineTextField(
                  keyboardType: TextInputType.text,
                  labelText: "toyDesc".locale,
                  minLines: 4,
                  maxLines: 4,
                  validator: (data) =>
                      data.length >= 1 ? null : "nullField".locale,
                ),
                SizedBox(height: 20),
                FatButton(text: "save".locale, onPressed: () {}),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
