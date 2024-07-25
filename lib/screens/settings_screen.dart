import 'package:cardapio/components/main_drawer.dart';
import 'package:cardapio/model/filter_settings.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final FilterSettings filterSettings;
  final Function(FilterSettings) onSettingsChanged;

  const SettingsScreen(
      {super.key,
      required this.onSettingsChanged,
      required this.filterSettings});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var filterSettings = FilterSettings();

  @override
  void initState() {
    super.initState();
    filterSettings = widget.filterSettings;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      activeTrackColor: Theme.of(context).canvasColor,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
        ),
      ),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(filterSettings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: <Widget>[
          // Container(
          //   padding: const EdgeInsets.all(20),
          //   child: Text(
          //     'Settings',
          //     style: Theme.of(context).textTheme.titleLarge,
          //   ),
          // ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                  'Gluten-free Meals',
                  'Just show meal without gluten',
                  filterSettings.isGlutenFree,
                  (value) =>
                      setState(() => filterSettings.isGlutenFree = value),
                ),
                _createSwitch(
                  'Lactose-free Meals',
                  'Just show meal without lactose',
                  filterSettings.isLactoseFree,
                  (value) =>
                      setState(() => filterSettings.isLactoseFree = value),
                ),
                _createSwitch(
                  'Vegan Meals',
                  'Just show vegan meal',
                  filterSettings.isVegan,
                  (value) => setState(() => filterSettings.isVegan = value),
                ),
                _createSwitch(
                  'Vegetarian Meals',
                  'Just show vegetarian meal',
                  filterSettings.isVegetarian,
                  (value) =>
                      setState(() => filterSettings.isVegetarian = value),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
