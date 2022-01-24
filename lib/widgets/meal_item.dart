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
                  bottom: 20,
                  right: 0,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Icon(Icons.schedule),
                        SizedBox(width: 6),
                        Text('$duration min'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Icon(Icons.work),
                        SizedBox(width: 6),
                        Text('$_complexityText'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Icon(Icons.attach_money),
                        SizedBox(width: 6),
                        Text('$_affordabilitytext'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
