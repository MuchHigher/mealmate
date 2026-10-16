import 'dart:convert';
import 'dart:io';

import '../models/meal.dart';

class MealApi {
  static const _base = 'https://www.themealdb.com/api/json/v1/1';
  Future<List<dynamic>> _get(String path, {String key = 'meals'}) async {
    final c = HttpClient();
    try {
      final r = await (await c.getUrl(Uri.parse('$_base/$path'))).close();
      if (r.statusCode != 200) throw const HttpException('API error');
      final data = jsonDecode(
        await r.transform(utf8.decoder).join(),
      ) as Map<String, dynamic>;
      return data[key] ?? [];
    } finally {
      c.close(force: true);
    }
  }

  Future<List<Category>> categories() async =>
      (await _get('categories.php', key: 'categories'))
          .map((e) => Category.fromJson(e))
          .toList();
  Future<List<Meal>> random() async =>
      (await Future.wait(List.generate(6, (_) => _get('random.php'))))
          .expand((e) => e)
          .map((e) => Meal.fromJson(e))
          .toList();
  Future<List<Meal>> search(String q) async =>
      (await _get('search.php?s=${Uri.encodeQueryComponent(q)}'))
          .map((e) => Meal.fromJson(e))
          .toList();
  Future<List<Meal>> category(String c) async =>
      (await _get('filter.php?c=${Uri.encodeQueryComponent(c)}'))
          .map((e) => Meal.fromJson(e))
          .toList();
  Future<Meal?> detail(String id) async {
    final x = await _get('lookup.php?i=$id');
    return x.isEmpty ? null : Meal.fromJson(x.first);
  }
}
