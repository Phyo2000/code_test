import 'package:code_test/controllers/model_controller.dart';
import 'package:code_test/models/model.dart';
import 'package:flutter/material.dart';

class EditScreen extends StatefulWidget {
  final Model model;
  final ModelController modelController;
  const EditScreen(
      {super.key, required this.model, required this.modelController});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  late TextEditingController _titleController;
  late TextEditingController _bodyController;
  late TextEditingController _userIdController;
  late TextEditingController _idController;

  @override
  void initState() {
    _titleController = TextEditingController(text: widget.model.title);
    _bodyController = TextEditingController(text: widget.model.body);
    _userIdController =
        TextEditingController(text: widget.model.userId.toString());
    _idController = TextEditingController(text: widget.model.id.toString());

    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    _userIdController.dispose();
    _idController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Post'),
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
            const SizedBox(height: 16.0),
            TextField(
              controller: _userIdController,
              decoration: const InputDecoration(
                labelText: 'User ID',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _idController,
              decoration: const InputDecoration(
                labelText: 'ID',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final String updatedTitle = _titleController.text;
                final String updatedBody = _bodyController.text;
                final int updatedUserId = int.parse(_userIdController.text);
                final int updatedId = int.parse(_idController.text);

                widget.modelController.updateModel(
                  widget.model.id,
                  updatedTitle,
                  updatedBody,
                  updatedId,
                  updatedUserId,
                );
                Navigator.pop(context);
              },
              child: const Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}
