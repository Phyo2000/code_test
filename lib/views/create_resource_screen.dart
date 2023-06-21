import 'package:code_test/controllers/model_controller.dart';
import 'package:code_test/views/list_screen.dart';
import 'package:flutter/material.dart';

class CreateScreen extends StatelessWidget {
  final ModelController modelController;

  CreateScreen({super.key, required this.modelController});

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final TextEditingController _userIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _bodyController,
              decoration: const InputDecoration(
                labelText: 'Body',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _userIdController,
              decoration: const InputDecoration(
                labelText: 'User Id',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final String title = _titleController.text;
                final String body = _bodyController.text;
                final int userId = int.parse(_userIdController.text);
                modelController.createModel(title, body, userId);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ListScreen(),
                  ),
                );
              },
              child: const Text('Create'),
            ),
          ],
        ),
      ),
    );
  }
}
