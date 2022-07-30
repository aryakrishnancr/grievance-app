import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String? username;
  final String? department;
  final String? desc;
  final String? type;
  final String? image;

  UserModel(
      {this.username,
      this.department,
      this.id,
      this.desc,
      this.type,
      this.image});

  factory UserModel.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return UserModel(
      username: snapshot['username'],
      department: snapshot['department'],
      desc: snapshot['description'],
      type: snapshot['type'],
      id: snapshot['id'],
      image: snapshot['image'],
    );
  }

  Map<String, dynamic> toJson() => {
        "username": username,
        "department": department,
        "description": desc,
        "type": type,
        "id": id,
        "image": image,
      };
}
