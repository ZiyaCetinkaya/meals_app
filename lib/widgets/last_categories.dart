import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/category_item.dart';

import '../models/category.dart';
import '../data/dummy_data.dart';

class LastCategories extends StatelessWidget {
  List<Category> get _lastCategories {
    var allMeals = List.of(DUMMY_CATEGORIES);
    allMeals.sort((a, b) =>
        DateTime.parse(b.createdAt).compareTo(DateTime.parse(a.createdAt)));
    return allMeals.take(5).toList();
  }

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Last Added Categories",
          style: Theme.of(context).textTheme.headline6,
        ),
        Divider(),
        Container(
          width: _screenWidth,
          height: 80,          
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(5),
                width: 180,
                child: CategoryItem(
                  color: _lastCategories[index].color,
                  id: _lastCategories[index].id,
                  title: _lastCategories[index].title,
                ),
              );
            },
            itemCount: _lastCategories.length,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
