
import 'dart:convert';

import 'package:untitled/data/models/category.dart';

Test testFromJson(String str) => Test.fromJson(json.decode(str));

String testToJson(Test data) => json.encode(data.toJson());

class Test {
  final List<Category> categories;

  Test({
    required this.categories,
  });

  factory Test.fromJson(Map<String, dynamic> json) => Test(
    categories: List<Category>.from(json["сategories"].map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "сategories": List<dynamic>.from(categories.map((x) => x.toJson())),
  };
}
