import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/constants.dart';

class AddVideo extends StatelessWidget {
  AddVideo({super.key});

  videoPick(ImageSource src) async {
    final video = await ImagePicker().pickVideo(source: src);
    if (video != null) {
      Get.snackbar("Video Selected", video.path);
    } else {
      Get.snackbar("Error Selecting Video", "Please Choose Different Video");
    }
  }

  showDialogOpt(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        children: [
          SimpleDialogOption(
            onPressed: () {
              videoPick(ImageSource.gallery);
            },
            child: Text("Gallery"),
          ),
          SimpleDialogOption(
            onPressed: () {
              videoPick(ImageSource.camera);
            },
            child: Text("Camera"),
          ),
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Close"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            showDialogOpt(context);
          },
          child: Container(
            width: 150,
            height: 40,
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text("Add Video"),
            ),
          ),
        ),
      ),
    );
  }
}
