import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;

class ProfileProvider with ChangeNotifier {
  bool _isImageLoading = false;
  String _imgLink = '';
  bool _studentDataLoaded = false;

  bool get studentDataLoading => _studentDataLoaded;
  //bool get isLoading => _isLoading;

  String get imgLink => _imgLink;
  bool get isImageLoading => _isImageLoading;
  void setStudentDataLoading(bool value) {
    _studentDataLoaded = value;
    notifyListeners();
  }

  void setImageLink(String srcLink) {
    _imgLink = srcLink;
    notifyListeners();
  }

  void setIsImageLoading(bool newLoadState) {
    _isImageLoading = newLoadState;
    notifyListeners();
  }

  File? _profileImage;
  File? get profileImage => _profileImage;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void setImage(File image) {
    _profileImage = image;
    notifyListeners();
  }

  Future<String> uploadImageToFirebaseStorage(File? image) async {
    // SmartDialog.showLoading();
    String imageURL = '';
    String fileName = Path.basename(image!.path);
    debugPrint('-------------------------------------------');
    var reference =
        FirebaseStorage.instance.ref().child('ProfileImages/$fileName');
    UploadTask uploadTask = reference.putFile(image);
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
    await taskSnapshot.ref.getDownloadURL().then((value) {
      imageURL = value;
      notifyListeners();
      debugPrint('Profile Image Added');
    }).catchError((e) {
      debugPrint('Error happened $e.toString()');
      // SmartDialog.dismiss();
    });

    return imageURL;
  }

  void clear() {
    _profileImage = null;
    notifyListeners();
  }

  void pickImage(ImageSource source, BuildContext context) async {
    final picker = ImagePicker();
    _isImageLoading = true;
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      _profileImage = File(pickedFile.path);
      _isImageLoading = false;

      String imgPathLink = await uploadImageToFirebaseStorage(_profileImage);
      if (imgPathLink != null) {
        FirebaseFirestore.instance
            .collection('Student')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({'profileImg': imgPathLink});
        _imgLink = imgPathLink;
      }
      notifyListeners();
      //Navigator.pop(context);
    } else {
      debugPrint('Error White packing image');
    }
  }
}
