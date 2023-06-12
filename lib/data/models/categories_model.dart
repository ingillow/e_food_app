
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:untitled/data/models/category.dart';
/*part 'categories_model.g.dart';*/


Test testFromJson(String str) => Test.fromJson(json.decode(str));

String testToJson(Test data) => json.encode(data.toJson());

class Test {
  final List<Ategory> ategories;

  Test({
    required this.ategories,
  });

  factory Test.fromJson(Map<String, dynamic> json) => Test(
    ategories: List<Ategory>.from(json["сategories"].map((x) => Ategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "сategories": List<dynamic>.from(ategories.map((x) => x.toJson())),
  };
}

class Ategory {
  final int id;
  final String name;
  final String imageUrl;

  Ategory({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory Ategory.fromJson(Map<String, dynamic> json) => Ategory(
    id: json["id"],
    name: json["name"],
    imageUrl: json["image_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image_url": imageUrl,
  };
}
