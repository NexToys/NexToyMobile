import 'package:flutter/material.dart';
import 'package:file/file.dart';
import 'package:file/memory.dart';

import 'package:NexToyMobile/Components/duckWidget.dart';
import 'package:NexToyMobile/Core/Extension/context_extension.dart';
import 'package:NexToyMobile/Core/Model/Toy/toyModel.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ToyCard extends StatelessWidget {
  final Toy toy;
  const ToyCard({
    Key key,
    this.toy,
  }) : super(key: key);
/* 
  Future downloadUrl() async {
    String url = (await FirebaseStorage.instance
        .ref('uploads/image_picker1603171492119954771.jpg')
        .getDownloadURL());
    return url; //Burada Future<dynamic> string olamaz hatası alıyorum.
  }  */ /* 
  downloadFile() {
    File _file = MemoryFileSystem().file('tmp');
    FirebaseStorage firebaseStorage = FirebaseStorage();
    StorageReference ref = firebaseStorage
        .ref()
        .child("upload/image_picker8918589069493287944.jpg");
    ref.putFile(_file);
    return _file;
    /* 
    File file = MemoryFileSystem().file('tmp');
    StorageReference storageRef =
        FirebaseStorage.instance.ref().child(toy.imageurl);
    storageRef.writeToFile(file);
    return file; //Burada Future<dynamic> file olamaz hatası alıyorum. */
  } */
  /* 

  Future<Widget> _getImage(BuildContext context, String image) async {
    Image m;
    await FirebaseStorage.loadImage(context, image).then((downloadUrl) {
      m = Image.network(
        downloadUrl.toString(),
        fit: BoxFit.scaleDown,
      );
    });
    return m;
  } */

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, right: 5, left: 5),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          AspectRatio(
            aspectRatio: 1 / 1,
            child: Card(
              elevation: 8,
              shadowColor: context.theme.accentColor.withOpacity(.7),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: context.theme.accentColor.withOpacity(.1)),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Container(
                padding: EdgeInsets.only(
                  left: 60,
                  top: 60,
                  right: 10,
                  bottom: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Duck(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Card(
                      elevation: 10,
                      shadowColor: context.theme.accentColor.withOpacity(.7),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: context.theme.accentColor.withOpacity(.1)),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          toy.imageurl,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    toy.name,
                    maxLines: 1,
                    overflow: TextOverflow.visible,
                    style: context.textTheme.headline6,
                  ),
                  Text(
                    toy.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
