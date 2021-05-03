import 'dart:io';

import 'package:CWCFlutter/model/food.dart';
import 'package:CWCFlutter/notifier/food_notifier.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import 'package:uuid/uuid.dart';



getGalorie(GalorieNotifier foodNotifier) async {
  QuerySnapshot snapshot = await Firestore.instance
      .collection('photos')
      .orderBy("createdAt", descending: true)
      .getDocuments();

  List<Galorie> _foodList = [];

  snapshot.documents.forEach((document) {
    Galorie food = Galorie.fromMap(document.data);
    _foodList.add(food);
  });

  foodNotifier.galorieList = _foodList;
}

uploadGalorieAndImage(Galorie food, bool isUpdating, File localFile, Function foodUploaded) async {
  if (localFile != null) {
    print("uploading image");

    var fileExtension = path.extension(localFile.path);
    print(fileExtension);

    var uuid = Uuid().v4();

    final StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('photos/images/$uuid$fileExtension');

    await firebaseStorageRef.putFile(localFile).onComplete.catchError((onError) {
      print(onError);
      
    });

    String url = await firebaseStorageRef.getDownloadURL();
    print("download url: $url");
    _uploadGalorie(food, isUpdating, foodUploaded, imageUrl: url);
  } else {
    print('...skipping image upload');
    _uploadGalorie(food, isUpdating, foodUploaded);
  }
}

_uploadGalorie(Galorie food, bool isUpdating, Function foodUploaded, {String imageUrl}) async {
  CollectionReference foodRef = Firestore.instance.collection('photos');

  if (imageUrl != null) {
    food.image = imageUrl;
  }

  if (isUpdating) {
    food.updatedAt = Timestamp.now();

    await foodRef.document(food.id).updateData(food.toMap());

    foodUploaded(food);
    print('updated  photo with id: ${food.id}');
  } else {
    food.createdAt = Timestamp.now();

    DocumentReference documentRef = await foodRef.add(food.toMap());

    food.id = documentRef.documentID;

    print('uploaded photo successfully: ${food.toString()}');

    await documentRef.setData(food.toMap(), merge: true);

    foodUploaded(food);
  }
}

deleteGalorie(Galorie food, Function foodDeleted) async {
  if (food.image != null) {
    StorageReference storageReference =
        await FirebaseStorage.instance.getReferenceFromUrl(food.image);

    print(storageReference.path);

    await storageReference.delete();

    print('image deleted');
  }

  await Firestore.instance.collection('photos').document(food.id).delete();
  foodDeleted(food);
}
