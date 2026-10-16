import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../services/meal_api.dart';
import '../main.dart';
import 'list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final api = MealApi(), query = TextEditingController();
  late Future<(List<Category>, List<Meal>)> data;
  @override
  void initState() {
    super.initState();
    data = load();
  }

  Future<(List<Category>, List<Meal>)> load() async =>
      (await api.categories(), await api.random());
  void go() {
    if (query.text.trim().isNotEmpty)
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) =>
              ListPage(title: 'Hasil pencarian', query: query.text.trim()),
        ),
      );
  }

  @override
  Widget build(BuildContext c) => Scaffold(
    body: SafeArea(
      child: FutureBuilder(
        future: data,
        builder: (c, s) {
          if (!s.hasData)
            return const Center(child: CircularProgressIndicator());
          final d = s.data!;
          return CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.all(20),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'MealMate',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const Text('Temukan resep untuk hari ini.'),
                      const SizedBox(height: 16),
                      TextField(
                        controller: query,
                        onSubmitted: (_) => go(),
                        decoration: InputDecoration(
                          hintText: 'Cari resep...',
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: IconButton(
                            onPressed: go,
                            icon: const Icon(Icons.arrow_forward),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 12),
                  child: Text(
                    'Kategori',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 52,
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    scrollDirection: Axis.horizontal,
                    itemCount: d.$1.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 10),
                    itemBuilder: (c, i) {
                      final x = d.$1[i];
                      return ActionChip(
                        avatar: CircleAvatar(
                          backgroundImage: NetworkImage(x.image),
                        ),
                        label: Text(x.name),
                        onPressed: () => Navigator.push(
                          c,
                          MaterialPageRoute(
                            builder: (_) =>
                                ListPage(title: x.name, category: x.name),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 12),
                  child: Text(
                    'Pilihan untukmu',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (_, i) => MealCard(meal: d.$2[i]),
                    childCount: d.$2.length,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: .75,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    ),
  );
}
