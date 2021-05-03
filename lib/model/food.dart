import 'package:cloud_firestore/cloud_firestore.dart';

class Galorie {
  String id;
  String name;
  String NomPrenom;
  String image;
  String description;
  Timestamp createdAt;
  Timestamp updatedAt;

  Galorie();

  Galorie.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    NomPrenom = data['nom et prenom'];
    image = data['image'];
    description = data['description'];
    createdAt = data['createdAt'];
    updatedAt = data['updatedAt'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'nom et prenom': NomPrenom,
      'image': image,
      'description': description,
      'createdAt': createdAt,
      'updatedAt': updatedAt
    };
  }
}
