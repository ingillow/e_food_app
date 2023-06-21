import 'package:flutter/cupertino.dart';
import 'package:untitled/data/models/dishes.dart';

class CartModel extends ChangeNotifier {
  List<Dish> cart = [];
  int prices = 0;

  void removeFromCart(Dish dish) {
    cart.remove(dish);
    sumTotalPrice();
    notifyListeners();
  }

  void addToFavorites(Dish dish) {
    final itemIndex = cart.indexWhere((e) => e.id == dish.id);
    if (itemIndex == -1) {
      cart.add(dish);
    } else {
      increaseQuantity(itemIndex, dish);
    }
    sumTotalPrice();
    notifyListeners();
  }

  void increaseQuantity(int itemIndex, Dish dish) {
    dish.quantity++;
    sumTotalPrice();
    notifyListeners();
  }

  void decreaseQuantity(Dish dish) {
    final itemIndex = cart.indexWhere((e) => e.id == dish.id);
    if (cart[itemIndex].quantity > 1) {
      cart[itemIndex].quantity--;
    } else {
      cart.remove(dish);
    }
    sumTotalPrice();
    notifyListeners();
  }

  void sumTotalPrice() {
    prices = cart.fold(0, (sum, dish) => sum + dish.price * dish.quantity);
  }
}
