class FilterSettings {
  bool isGlutenFree;
  bool isLactoseFree;
  bool isVegetarian;
  bool isVegan;

  FilterSettings({
    this.isGlutenFree = false,
    this.isLactoseFree = false,
    this.isVegan = false,
    this.isVegetarian = false,
  });
}
