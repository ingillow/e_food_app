import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DishesPage extends StatefulWidget {
  const DishesPage({Key? key}) : super(key: key);

  @override
  State<DishesPage> createState() => _DishesPageState();
}

class _DishesPageState extends State<DishesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dishes'),
      ),
    );
  }
}
