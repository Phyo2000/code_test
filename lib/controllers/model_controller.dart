import 'package:code_test/models/model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ModelController {
  List<Model> models = [];

  Future<void> fetchModels() async {
    try {
      final response =
          await Dio().get('https://jsonplaceholder.typicode.com/posts');

      //debugPrint("###### ${response.data.toString()} #######");
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        debugPrint(data.toString());
        models = data.map((json) => Model.fromJson(json)).toList();
      }
    } catch (error) {
      // Showing Error
    }
  }

  Future<void> createModel(String title, String body) async {
    try {
      final response = await Dio().post(
        'https://jsonplaceholder.typicode.com/posts',
        data: {'title': title, 'body': body, 'userId': 1},
        options: Options(headers: {
          'Content-type': 'application/json; charset=UTF-8',
        }),
      );

      if (response.statusCode == 201) {
        final dynamic data = response.data;
        final Model model = Model.fromJson(data);
        models.add(model);
      }
    } catch (error) {
      // Error
    }
  }
}
