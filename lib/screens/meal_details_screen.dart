import 'package:flutter/material.dart';

import '../data/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = "/meal-details";

  final Function _toggleFavorite;
  final Function _isMealFavorite;

  const MealDetailsScreen(this._toggleFavorite, this._isMealFavorite);

  Widget _buildSectionTitle(BuildContext ctx, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(ctx).textTheme.headline6,
      ),
    );
  }

  Widget _buildSection(BuildContext ctx, List<String> items) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (ctx, index) => Card(
          color: Theme.of(ctx).accentColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 10,
            ),
            child: Text(items[index]),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _mealId = ModalRoute.of(context).settings.arguments as String;
    final _selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == _mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                _selectedMeal.imageUrl,
                fit: BoxFit.contain,
              ),
            ),
            _buildSectionTitle(context, "Ingredients"),
            _buildSection(context, _selectedMeal.ingredients),
            Divider(),
            _buildSectionTitle(context, "Steps"),
            _buildSection(context, _selectedMeal.steps),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          _isMealFavorite(_mealId) ? Icons.star : Icons.star_border,
        ),
        onPressed: () {
          _toggleFavorite(_mealId);
        },
      ),
    );
  }
}
