import 'package:code_test/controllers/model_controller.dart';
import 'package:code_test/models/model.dart';
import 'package:code_test/views/edit_screen.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Model model;
  final ModelController modelController;

  const DetailsScreen(
      {super.key, required this.model, required this.modelController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'User ID',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Text(model.userId.toString()),
            const SizedBox(height: 8.0),
            const Text(
              'ID',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Text(model.id.toString()),
            const SizedBox(height: 8.0),
            const Text(
              'Title',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Text(model.title),
            const SizedBox(height: 8.0),
            const Text(
              'Body',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Text(model.body),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _navigateToEditScreen(context, model);
                  },
                  child: const Text('Edit'),
                ),
                const SizedBox(width: 18.0),
                ElevatedButton(
                  onPressed: () {
                    _deleteModel(context, model);
                  },
                  child: const Text('Delete'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToEditScreen(BuildContext context, Model model) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            EditScreen(model: model, modelController: modelController),
      ),
    );
  }

  void _deleteModel(BuildContext context, Model model) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete Model'),
          content: const Text('Are you sure you want to delete this model?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                modelController.deleteModel(model.id);
                Navigator.pop(context); // Close the dialog
                Navigator.pop(context); // Go back to the previous screen
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
