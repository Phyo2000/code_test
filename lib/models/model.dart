import 'package:flutter/material.dart';

class Model {
  int userId;
  int id;
  String title;
  String body;

  Model(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body']);
  }
}
