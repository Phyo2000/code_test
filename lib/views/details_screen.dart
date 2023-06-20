import 'package:code_test/models/model.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Model model;
  const DetailsScreen({super.key, required this.model});

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
          ],
        ),
      ),
    );
  }
}
