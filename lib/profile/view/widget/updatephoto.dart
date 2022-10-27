import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'package:softage_app/const/const.dart';
import 'dart:convert';

class Updatephoto extends StatefulWidget {
  String? myimage;

  @override
  _UpdatephotoState createState() => _UpdatephotoState();

  Updatephoto({
    this.myimage,
  });
}

class _UpdatephotoState extends State<Updatephoto> {
  File? imageFile;
  String? fileName;

  final picker = ImagePicker();

  Future<void> _showSelectionDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text("From where do you want to take the photo?"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    GestureDetector(
                      child: const Text("Gallery"),
                      onTap: () {
                        _getFromGallery();
                        Navigator.pop(context);
                      },
                    ),
                    const Padding(padding: EdgeInsets.all(8.0)),
                    GestureDetector(
                      child: const Text("Camera"),
                      onTap: () {
                        _getFromCamera();
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ));
        });
  }

  /// Get from gallery
  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        print("imageFile----------------------------->$imageFile");

        // List<int> imageBytes = imageFile.readAsBytesSync();
        // print(imageBytes);
        // base64Image = base64UrlEncode(imageBytes);
        List<int> imageBytes = imageFile!.readAsBytesSync();
        photo = base64Encode(imageBytes);

        print(" code=>>${imageBytes}");
        // updatimge(base64Image, id);
      });
    }
  }

  /// Get from Camera
  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        // print("imageFile----------------------------->$imageFile");
        // List<int> imageBytes = imageFile.readAsBytesSync();
        // print("dddd$imageBytes");
        // base64Image = base64UrlEncode(imageBytes);
        List<int> imageBytes = imageFile!.readAsBytesSync();
        photo = base64Encode(imageBytes);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
// Create a reference to "mountains.jpg"

    print(photo);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            _showSelectionDialog(context);
          },
          icon: const Icon(
            Icons.camera_enhance,
            color: Colors.blue,
          ),
        ),
        imageFile == null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(
                  image: NetworkImage(widget.myimage.toString()),
                  height: 100,
                  width: 100,
                  fit: BoxFit.fill,
                ),
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(
                  image: FileImage(imageFile!),
                  height: 100,
                  width: 100,
                  fit: BoxFit.fill,
                ),
              ),
      ],
    );
  }
}
