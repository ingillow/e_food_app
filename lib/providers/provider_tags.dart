import 'package:flutter/cupertino.dart';
import 'package:untitled/data/models/dishes.dart';

class ToggleTags extends ChangeNotifier {
  final List<Teg> _selectedTags = [];
  final List<Dish> _cart = [];

  List<Teg> get selectedTags => _selectedTags;

  List<Dish> get cart => _cart;

  void toggleTag(Teg tag) {
    if (_selectedTags.contains(tag)) {
      _selectedTags.remove(tag);
    } else {
      _selectedTags.add(tag);
    }
    notifyListeners();
  }

  bool isDishVisible(Dish? dish) {
    if (_selectedTags.isEmpty) {
      return true;
    }

    for (var tag in _selectedTags) {
      if (dish?.tegs.contains(tag) ?? false) {
        return true;
      }
    }

    return false;
  }

  void addToCart(Dish? dish) {
    _cart.add(dish!);
    notifyListeners();
  }
}
