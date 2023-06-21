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
  late TextEditingController _searchController;
  late List<Model> _filteredModels;
  bool _isSearch = false;

  @override
  void initState() {
    _controller = ModelController();
    _controller.fetchModels();
    _filteredModels = [];
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: _filterModels,
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: _controller.fetchModels(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return ListView.builder(
                    itemCount: _isSearch
                        ? _filteredModels.length
                        : _controller.models.length,
                    itemBuilder: (context, index) {
                      final model = _isSearch
                          ? _filteredModels[index]
                          : _controller.models[index];
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
          ),
        ],
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
        builder: (context) => DetailsScreen(
          model: model,
          modelController: _controller,
        ),
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

  void _filterModels(String query) {
    setState(() {
      if (query.isNotEmpty) {
        _isSearch = true;
        _filteredModels = _controller.models.where((model) {
          final userId = model.userId;
          final searchQuery = int.parse(query);
          return userId == searchQuery;
        }).toList();
      } else {
        _isSearch = false;
      }
    });
  }
}
