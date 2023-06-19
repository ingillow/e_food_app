import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/models/dishes.dart';

class SavedDishesPage extends StatelessWidget {
  const SavedDishesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartModel = Provider.of<CartModel>(context, listen: false);
    final savedDishes = cartModel.cart;

    return Scaffold(
        appBar: AppBar(
          title: Text('Saved Dishes'),
        ),
        body: ListView.builder(
          itemCount: savedDishes.length,
          itemBuilder: (context, index) {
            final dish = savedDishes[index];
            return ListTile(
              leading: Image.network(dish.imageUrl),
              title: Text(dish.name),
              subtitle: Text(dish.price.toString()),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      cartModel.decreaseQuantity(dish);
                    },
                  ),
                  Text(dish.quantity.toString()),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      cartModel.increaseQuantity(dish.quantity, dish);
                    },
                  ),
                ],
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {}, label: Text(cartModel.prices.toString())));
  }
}

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
