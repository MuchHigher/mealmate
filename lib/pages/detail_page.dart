import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../services/meal_api.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.meal});
  final Meal meal;
  @override
  Widget build(BuildContext c) => Scaffold(
    body: FutureBuilder<Meal?>(
      future: MealApi().detail(meal.id),
      builder: (c, s) {
        if (s.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator());
        if (s.hasError || s.data == null) return const Center(child: Text('Detail resep tidak dapat dimuat.'));
        final m = s.data!;
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 280,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(m.image, fit: BoxFit.cover),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  Text(
                    m.name,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text('${m.category ?? ''} ${m.area ?? ''}'),
                  const SizedBox(height: 20),
                  const Text(
                    'Bahan-bahan',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  ...m.ingredients.map(
                    (x) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: Text('• $x'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Cara memasak',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    m.instructions ?? '',
                    style: const TextStyle(height: 1.5),
                  ),
                ]),
              ),
            ),
          ],
        );
      },
    ),
  );
}
