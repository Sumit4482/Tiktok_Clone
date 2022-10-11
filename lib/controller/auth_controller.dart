// ignore_for_file: avoid_print

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/model/user.dart';
import 'package:tiktok_clone/view/screens/auth/home_screen.dart';
import 'package:tiktok_clone/view/screens/auth/login_screen.dart';

class AuthController extends GetxController {
  // Before Calling any Method of AuthController , First you have to Create a instance
  static AuthController instance = Get.find();

  // will contain profile image
  File? proimg;

  // Image picker from Gallery.

  pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final img = File(image.path);
    proimg = img;
  }

  // To Keep user logged in after one log-in
  //
  late Rx<User?> _user;
  @override
  void onReady() {
    super.onReady();

    _user = Rx<User?>(FirebaseAuth.instance.currentUser);

    _user.bindStream(FirebaseAuth.instance.authStateChanges());

    ever(_user, _setInitialView);
  }

  _setInitialView(User? user) {
    if (user == null) {
      Get.offAll(() => LoginScreen());
    } else {
      Get.offAll(() => const HomeScreen());
    }
  }

  // Model - New User SignUp
  void signUp(
    String username,
    String password,
    String email,
    File? image,
  ) async {
    try {
      //Validation Check Bro !!

      if (username.isNotEmpty &&
          password.isNotEmpty &&
          email.isNotEmpty &&
          image != null) {
        // Assigning Credential
        UserCredential credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        //Collection Download Url of Uploaded Image.
        String dwnloadUrl = await _uploadProPic(image);

        //Instance of USER Class
        //assigning values inserted by user in the fields
        MyUser user = MyUser(
            email: email,
            name: username,
            uid: credential.user!.uid,
            profilePhoto: dwnloadUrl);

        //Uploading Data to FireBase Firestore
        // Calling toJson method
        await FirebaseFirestore.instance
            .collection('users')
            .doc(credential.user!.uid)
            .set(user.toJson());

        print("Sucessfully Created Account  !!");
      } else {
        Get.snackbar(
            "Error Creating Account", "Please Enter all the Required Fields");
      }
    } catch (e) {
      print(e);
      Get.snackbar("Error Occured", e.toString());
    }
  }
  // Upload Image to Firebase Storage.
//Create a Reference
// Here Child means the Folder Directory
// we can create nested folder by adding more child

  Future<String> _uploadProPic(File image) async {
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('profilePics')
        .child(FirebaseAuth.instance.currentUser!.uid);
    // use the refernce to upload File
    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snapshot = await uploadTask;
    // Collection and Returning URL
    String imgDwnUrl = await snapshot.ref.getDownloadURL();
    return imgDwnUrl;
  }

  // Login User
  void login(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
      } else {
        Get.snackbar("Error Logging in", "Please Enter all the required Field");
      }
    } catch (e) {
      Get.snackbar("Error Logging in", e.toString());
    }
  }
}
