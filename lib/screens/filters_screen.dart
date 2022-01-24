import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters";

  final Function _saveFilters;
  final Map<String, bool> _filters;

  const FiltersScreen(this._filters, this._saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegeterian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget._filters["gluten"];
    _lactoseFree = widget._filters["lactose"];
    _vegeterian = widget._filters["vegeterian"];
    _vegan = widget._filters["vegan"];

    super.initState();    
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function changeHandler,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: changeHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
        actions: [
          IconButton(
            onPressed: () {
              final filters = {
                "gluten": _glutenFree,
                "lactose": _lactoseFree,
                "vegan": _vegan,
                "vegeterian": _vegeterian,
              };
              widget._saveFilters(filters);
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection.",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                  "Gluten-free",
                  "Only include gluten-free meals",
                  _glutenFree,
                  (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  "Lactose-free",
                  "Only include lactose-free meals",
                  _lactoseFree,
                  (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  "Vegeterian",
                  "Only include vegeterian meals",
                  _vegeterian,
                  (newValue) {
                    setState(() {
                      _vegeterian = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  "Vegan",
                  "Only include vegan meals",
                  _vegan,
                  (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
