class Meal {
  const Meal({
    required this.id,
    required this.name,
    required this.image,
    this.category,
    this.area,
    this.instructions,
    this.ingredients = const [],
  });
  final String id, name, image;
  final String? category, area, instructions;
  final List<String> ingredients;
  factory Meal.fromJson(Map<String, dynamic> j) {
    final list = <String>[];
    for (var i = 1; i <= 20; i++) {
      final n = (j['strIngredient$i'] ?? '').toString().trim();
      final m = (j['strMeasure$i'] ?? '').toString().trim();
      if (n.isNotEmpty) list.add(m.isEmpty ? n : '$m $n');
    }
    return Meal(
      id: j['idMeal'],
      name: j['strMeal'],
      image: j['strMealThumb'] ?? '',
      category: j['strCategory'],
      area: j['strArea'],
      instructions: j['strInstructions'],
      ingredients: list,
    );
  }
}

class Category {
  const Category(this.name, this.image);
  final String name, image;
  factory Category.fromJson(Map<String, dynamic> j) =>
      Category(j['strCategory'], j['strCategoryThumb'] ?? '');
}
