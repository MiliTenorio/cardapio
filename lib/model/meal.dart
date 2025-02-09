enum Complexity {
  Simple,
  Medium,
  Difficult,
}

enum Cost {
  Cheap,
  Fair,
  Expensive,
}

class Meal {
  final int id;
  final List<int> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  final Complexity complexity;
  final Cost cost;
  final bool isFavorite;

  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.complexity,
    required this.cost,
    this.isFavorite = false,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Medium:
        return 'Medium';
      case Complexity.Difficult:
        return 'Difficult';
      default:
        return 'Unknown';
    }
  }

  String get costText {
    switch (cost) {
      case Cost.Cheap:
        return 'Cheap';
      case Cost.Fair:
        return 'Fair';
      case Cost.Expensive:
        return 'Expensive';
      default:
        return 'Unknown';
    }
  }
}
