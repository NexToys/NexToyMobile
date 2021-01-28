import 'dart:convert';
import 'dart:io';

import 'package:NexToyMobile/Components/fat_button.dart';
import 'package:NexToyMobile/Components/outline_text_field.dart';
import 'package:NexToyMobile/Core/Extension/context_extension.dart';
import 'package:NexToyMobile/Core/Extension/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:NexToyMobile/Components/globals.dart' as global;
import 'package:firebase_storage/firebase_storage.dart';

class AddingToysView extends StatefulWidget {
  @override
  _AddingToysViewState createState() => _AddingToysViewState();
}

class _AddingToysViewState extends State<AddingToysView> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  File _imageFile;
  String name = "",
      type = "",
      description = "",
      _imageUrl = "",
      _imagePath = "",
      status = '';
  final ImagePicker picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    print(pickedFile.path);
    print(status);
    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
        _imagePath = pickedFile.path;
        uploadToFirebase();
      } else {
        print('No image selected.');
      }
    });
  }

  Future uploadToFirebase() async {
    String imageName = _imagePath.split('/').last;
    StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('$imageName');
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(_imageFile);
    StorageTaskSnapshot snapshot = await uploadTask.onComplete;
    var image = await snapshot.ref.getDownloadURL();
    _imageUrl = image;
    print(image);
  }

  Future postData() async {
    final response = await http
        .post(global.baseUrl + '/api/toy/register', body: <String, dynamic>{
      "isActive": "true",
      "name": name,
      "type": type,
      "description": description,
      "ownerId": global.activeUser.sId,
      "imageurl": _imageUrl
    });

    final jsonBody = jsonDecode(response.body);
    print(jsonBody);
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
                      child: _imageFile == null
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
                          : Image.file(_imageFile, fit: BoxFit.fill),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                OutlineTextField(
                  onChanged: (data) => name = data,
                  keyboardType: TextInputType.text,
                  labelText: "toyName".locale,
                  validator: (data) =>
                      data.length >= 1 ? null : "nullField".locale,
                ),
                SizedBox(height: 20),
                OutlineTextField(
                  onChanged: (data) => type = data,
                  keyboardType: TextInputType.text,
                  labelText: "toyType".locale,
                  validator: (data) =>
                      data.length >= 1 ? null : "nullField".locale,
                ),
                SizedBox(height: 20),
                OutlineTextField(
                  onChanged: (data) => description = data,
                  keyboardType: TextInputType.text,
                  labelText: "toyDesc".locale,
                  minLines: 4,
                  maxLines: 4,
                  validator: (data) =>
                      data.length >= 1 ? null : "nullField".locale,
                ),
                SizedBox(height: 20),
                FatButton(
                    text: "save".locale,
                    onPressed: () {
                      if (name.length > 1 &&
                          type.length > 1 &&
                          description.length > 1 &&
                          _imageUrl.length > 0) {
                        print(name + type + description);
                        postData();
                      } else {
                        print("boş");
                      }
                    }),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
