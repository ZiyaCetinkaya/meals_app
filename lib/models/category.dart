import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;
  final String createdAt;

  const Category({
    @required this.id,
    @required this.title,
    @required this.createdAt,
    this.color = Colors.orange,
  });
}
