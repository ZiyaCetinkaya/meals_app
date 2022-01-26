import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../helpers/enum_to_text.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = "/meal-details";

  final Function _toggleFavorite;
  final Function _isMealFavorite;

  const MealDetailsScreen(this._toggleFavorite, this._isMealFavorite);

  Widget _buildImageSection(BuildContext ctx, String imageUrl, String mealId) {
    return Container(
      width: double.infinity,
      child: Stack(
        children: [
          Image.network(
            imageUrl,
            fit: BoxFit.fill,
          ),
          Positioned(
            bottom: 15,
            right: 15,
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
              child: IconButton(
                onPressed: () => _toggleFavorite(mealId),
                icon: Icon(
                  _isMealFavorite(mealId) ? Icons.star : Icons.star_border,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAttributesSection(duration, complexity, affordability) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Icon(Icons.timer_outlined),
              SizedBox(
                height: 5,
              ),
              Text('${duration} min.'),
            ],
          ),
          Column(
            children: [
              Icon(Icons.fitness_center_outlined),
              SizedBox(
                height: 5,
              ),
              Text('${EnumToText.getComplexityText(complexity)}'),
            ],
          ),
          Column(
            children: [
              Icon(Icons.paid_outlined),
              SizedBox(
                height: 5,
              ),
              Text('${EnumToText.getAffordabilityText(affordability)}'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext ctx, String text, int count) {
    return Container(
      width: double.infinity,
      color: Theme.of(ctx).primaryColor,
      padding: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            child: Text(
              "$count",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(BuildContext ctx, List<String> items) {
    return Container(
      height: items.length * 30.00,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Container(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 15,
            ),
            color: index.isEven
                ? Colors.transparent
                : Colors.grey.withOpacity(0.2),
            child: Text(
              "${index + 1}: ${items[index]}",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          );
        },
        itemCount: items.length,
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
            _buildImageSection(context, _selectedMeal.imageUrl, _mealId),
            _buildAttributesSection(
              _selectedMeal.duration,
              _selectedMeal.complexity,
              _selectedMeal.affordability,
            ),
            _buildSectionTitle(
              context,
              "Ingredients",
              _selectedMeal.ingredients.length,
            ),
            _buildSection(
              context,
              _selectedMeal.ingredients,
            ),
            _buildSectionTitle(
              context,
              "Steps",
              _selectedMeal.steps.length,
            ),
            _buildSection(
              context,
              _selectedMeal.steps,
            ),
          ],
        ),
      ),
    );
  }
}
