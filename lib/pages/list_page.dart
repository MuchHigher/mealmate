import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../services/meal_api.dart';
import '../main.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key, required this.title, this.category, this.query});
  final String title;
  final String? category, query;
  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final api = MealApi();
  late Future<List<Meal>> data;
  @override
  void initState() {
    super.initState();
    data = widget.category != null
        ? api.category(widget.category!)
        : api.search(widget.query!);
  }

  @override
  Widget build(BuildContext c) => Scaffold(
    appBar: AppBar(title: Text(widget.title)),
    body: FutureBuilder(
      future: data,
      builder: (c, s) {
        if (!s.hasData) return const Center(child: CircularProgressIndicator());
        final x = s.data!;
        return GridView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: x.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: .75,
          ),
          itemBuilder: (_, i) => MealCard(meal: x[i]),
        );
      },
    ),
  );
}
