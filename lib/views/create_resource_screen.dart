import 'package:code_test/controllers/model_controller.dart';
import 'package:flutter/material.dart';

class CreateScreen extends StatelessWidget {
  final ModelController modelController;

  CreateScreen({super.key, required this.modelController});

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Post'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _bodyController,
              decoration: InputDecoration(
                labelText: 'Body',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final String title = _titleController.text;
                final String body = _bodyController.text;
                modelController.createModel(title, body);
                Navigator.pop(context);
              },
              child: Text('Create'),
            ),
          ],
        ),
      ),
    );
  }
}
