import 'package:flutter/material.dart';

import 'models/meal.dart';
import 'pages/detail_page.dart';
import 'pages/home_page.dart';

void main() => runApp(const MealMateApp());

class MealMateApp extends StatelessWidget {
  const MealMateApp({super.key});
  @override
  Widget build(BuildContext c) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'MealMate',
    theme: ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffd9613c)),
      scaffoldBackgroundColor: const Color(0xfffffaf7),
    ),
    home: const HomePage(),
  );
}

class MealCard extends StatelessWidget {
  const MealCard({super.key, required this.meal});
  final Meal meal;
  @override
  Widget build(BuildContext context) => InkWell(
    onTap: () => Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => DetailPage(meal: meal)),
    ),
    borderRadius: BorderRadius.circular(18),
    child: Ink(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(18),
              ),
              child: Image.network(
                meal.image,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              meal.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    ),
  );
}
