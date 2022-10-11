import 'package:cloud_firestore/cloud_firestore.dart';

//Model User
class MyUser {
  String name;
  String email;
  String uid;
  String profilePhoto;

  // Construtor
  MyUser({
    required this.email,
    required this.name,
    required this.uid,
    required this.profilePhoto,
  });

  // Sending Data App to Firebase(Note: Firebase accepts data in Map<String,dynamic> )
  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "uid": uid,
        "profilePic": profilePhoto,
      };

  // Made this method Static to get data without creating OBJECT
  // Getting Data from Firebase to App(MyUser)
  static MyUser fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return MyUser(
        email: snapshot['email'],
        name: snapshot['name'],
        uid: snapshot['uid'],
        profilePhoto: snapshot['profilePic']);
  }
}
