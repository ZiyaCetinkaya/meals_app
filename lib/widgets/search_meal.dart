import 'package:flutter/material.dart';

import '../screens/meal_details_screen.dart';

import '../data/dummy_data.dart';
import '../models/meal.dart';

class SearchMeal extends StatefulWidget {
  @override
  State<SearchMeal> createState() => _SearchMealState();
}

class _SearchMealState extends State<SearchMeal> {
  void _selectMeal(BuildContext context, String id) {
    Navigator.of(context).pushNamed(MealDetailsScreen.routeName, arguments: id);
  }

  final _searchTextController = TextEditingController();

  List<Meal> _searchedMeals = [];
  void _searchMealHandler(String value) {
    if (value != null && value.length > 2) {
      setState(() {
        _searchedMeals = DUMMY_MEALS
            .where((meal) =>
                meal.title.toLowerCase().indexOf(value.toLowerCase()) >= 0)
            .toList();
      });
    } else {
      setState(() {
        _searchedMeals = [];
      });
    }
  }

  Widget get _getSearchResult {
    if (_searchTextController.text == "" &&
        _searchTextController.text.length <= 0) {
      return SizedBox(
        height: 0,
      );
    } else if (_searchTextController.text != "" &&
        _searchTextController.text.length > 0 &&
        _searchTextController.text.length < 3 &&
        _searchedMeals.length <= 0) {
      return Container(
        padding: EdgeInsets.only(top: 5),
        child: Text("Type more than 2 character."),
      );
    } else if (_searchTextController.text != "" && _searchedMeals.length <= 0) {
      return Container(
        padding: EdgeInsets.only(top: 5),
        child: Text("Meal Not Found"),
      );
    } else {
      return Container(
        padding: EdgeInsets.only(top: 5),
        height: _searchedMeals.length * 65.0,
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return ListTile(
              onTap: () => _selectMeal(context, _searchedMeals[index].id),
              leading: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                child: Image.network(
                  _searchedMeals[index].imageUrl,
                  height: 70,
                  width: 70,
                  fit: BoxFit.contain,
                ),
              ),
              title: Text(
                _searchedMeals[index].title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
          itemCount: _searchedMeals.length,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: _screenWidth - 50,
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.15),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration.collapsed(
                    hintText: "Search Meal",
                    border: InputBorder.none,
                  ),
                  onChanged: _searchMealHandler,
                  controller: _searchTextController,
                ),
              ),
              _searchTextController.text.length > 0
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          _searchTextController.text = "";
                        });
                      },
                      icon: Icon(
                        Icons.clear,
                        color: Theme.of(context).primaryColor,
                      ),
                    )
                  : IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.search),
                      color: Theme.of(context).primaryColor,
                    ),
            ],
          ),
        ),
        _getSearchResult
      ],
    );
  }
}
