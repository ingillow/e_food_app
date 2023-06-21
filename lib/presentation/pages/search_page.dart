import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/providers/provider_dish.dart';

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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
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
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Check out ' + cartModel.prices.toString()),
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(300, 50),
              ),
            ),
          )
        ],
      ),
    );
  }
}
