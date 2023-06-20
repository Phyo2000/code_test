import 'package:code_test/controllers/model_controller.dart';
import 'package:code_test/models/model.dart';
import 'package:code_test/views/create_resource_screen.dart';
import 'package:code_test/views/details_screen.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  late ModelController _controller;

  @override
  void initState() {
    _controller = ModelController();
    _controller.fetchModels();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data'),
      ),
      body: FutureBuilder(
        future: _controller.fetchModels(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: _controller.models.length,
              itemBuilder: (context, index) {
                final model = _controller.models[index];
                return Padding(
                  padding: const EdgeInsets.all(15),
                  child: InkWell(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("User ID : ${model.userId}"),
                        Text("ID : ${model.id}"),
                        Text("Title : ${model.title}"),
                        Text("Body : ${model.body}"),
                        const Divider(
                          thickness: 3,
                        ),
                      ],
                    ),
                    onTap: () {
                      _navigateToDetailsScreen(model);
                    },
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateToCreateScreen();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _navigateToDetailsScreen(Model model) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsScreen(model: model),
      ),
    );
  }

  void _navigateToCreateScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateScreen(
          modelController: _controller,
        ),
      ),
    );
  }
}
