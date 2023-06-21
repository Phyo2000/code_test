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

  Future<void> createModel(String title, String body, int userId) async {
    try {
      final Map<String, dynamic> headers = {
        'Content-type': 'application/json; charset=UTF-8',
      };
      final response = await Dio().post(
        'https://jsonplaceholder.typicode.com/posts',
        data: {'title': title, 'body': body, 'userId': userId},
        options: Options(headers: headers),
      );

      if (response.statusCode == 201) {
        final dynamic data = response.data;
        final Model model = Model.fromJson(data);
        models.add(model);
        debugPrint(response.data.toString());
      }
    } catch (error) {
      // Error
    }
  }

  Future<void> updateModel(int id, String updatedTitle, String updatedBody,
      int updatedId, int updatedUserId) async {
    try {
      final response = await Dio().put(
        'https://jsonplaceholder.typicode.com/posts/$id',
        data: {
          'userId': updatedUserId,
          'id': updatedId,
          'title': updatedTitle,
          'body': updatedBody,
        },
        options: Options(
          headers: {
            'Content-type': 'application/json; charset=UTF-8',
          },
        ),
      );

      if (response.statusCode == 200) {
        final updatedModel = Model(
          userId: updatedUserId,
          id: updatedId,
          title: updatedTitle,
          body: updatedBody,
        );

        debugPrint(response.toString());

        final int index = models.indexWhere((model) => model.id == id);
        if (index != -1) {
          models[index] = updatedModel;
        }
      }
    } catch (error) {
      // Handle error
    }
  }

  Future<void> deleteModel(int id) async {
    final url = 'https://jsonplaceholder.typicode.com/posts/$id';

    try {
      final response = await Dio().delete(url);
      if (response.statusCode == 200) {
        int index = models.indexWhere((model) => model.id == id);
        if (index != -1) {
          models.removeAt(index);
        }
      }
    } catch (error) {
      //
    }
  }
}
