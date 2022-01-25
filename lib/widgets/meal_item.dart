import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/meal.dart';
import 'package:flutter_complete_guide/screens/meal_details_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final COMPLEXITY complexity;
  final AFFORDABILITY affordability;

  const MealItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
  });

  String get _complexityText {
    switch (complexity) {
      case COMPLEXITY.Challenging:
        return "Challenging";
      case COMPLEXITY.Hard:
        return "Hard";
      case COMPLEXITY.Simple:
        return "Simple";
      default:
        return "Unknown";
    }
  }

  String get _affordabilitytext {
    switch (affordability) {
      case AFFORDABILITY.Affordable:
        return "Affordable";
      case AFFORDABILITY.Luxurious:
        return "Luxurious";
      case AFFORDABILITY.Pricey:
        return "Pricey";
      default:
        return "Unknown";
    }
  }

  void _selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetailsScreen.routeName, arguments: id);
  }

  Widget _buildImageAttribute(
      BuildContext context, String text, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          bottomLeft: Radius.circular(25),
        ),
        color: Theme.of(context).accentColor,
      ),
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            icon,
            color: Colors.black.withOpacity(0.7),
            size: 30,
          ),
          SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 250,
                    width: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildImageAttribute(
                          context,
                          '$duration min',
                          Icons.schedule,
                        ),
                        SizedBox(height: 10),
                        _buildImageAttribute(
                          context,
                          '$_complexityText',
                          Icons.work,
                        ),
                        SizedBox(height: 10),
                        _buildImageAttribute(
                          context,
                          '$_affordabilitytext',
                          Icons.attach_money,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
