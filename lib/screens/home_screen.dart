import 'package:flutter/material.dart';

import '../widgets/popular_meals.dart';
import '../widgets/search_meal.dart';
import '../widgets/last_categories.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(      
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            color: Colors.white,
            child: Column(
              children: [
                SearchMeal(),
                SizedBox(height: 40),
                PopularMeals(),
                SizedBox(height: 40),
                LastCategories()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
