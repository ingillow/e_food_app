import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:untitled/data/models/dishes.dart';
import 'package:untitled/data/remote/api_service_client.dart';
import 'package:untitled/presentation/pages/search_page.dart';

class DishesPage extends StatefulWidget {
  const DishesPage({Key? key}) : super(key: key);

  @override
  State<DishesPage> createState() => _DishesPageState();
}

class _DishesPageState extends State<DishesPage> {
  ApiServiceClient apiServiceClient = ApiServiceClient(Dio());

  Dio dio = Dio();

  Future<Dishes> fetchDishes() async {
    try {
      final resp = await dio
          .get('https://run.mocky.io/v3/aba7ecaa-0a70-453b-b62d-0e326c859b3b');
      print(resp.statusCode);
      final tegList = Dishes.fromJson(resp.data);
      print('here');
      return tegList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  List<Teg> selectedTags = [];

  void toggleTag(Teg tag) {
    if (selectedTags.contains(tag)) {
      selectedTags.remove(tag);
    } else {
      selectedTags.add(tag);
    }
  }

  bool isDishVisible(Dish? dish) {
    if (selectedTags.isEmpty) {
      return true;
    }

    for (var tag in selectedTags) {
      if (dish?.tegs.contains(tag) ?? false) {
        return true;
      }
    }

    return false;
  }

  List<Dish> cart = [];

  void addToCart(Dish? dish) {
    cart.add(dish!);
    print('added?');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dishes'),
      ),
      body: FutureBuilder<Dishes>(
        future: fetchDishes(),
        builder: (context, snapshot) {
          print(snapshot.data?.dishes.toString());
          return Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: tegValues.map.entries.map((e) {
                      var tag = e.value;
                      var isSelected = selectedTags.contains(tag);

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FilterChip(
                          label: Text(e.key),
                          selected: isSelected,
                          onSelected: (bool value) {
                            setState(() {
                              toggleTag(tag);
                            });
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: snapshot.data?.dishes.length,
                  itemBuilder: (BuildContext context, int index) {
                    var dish = snapshot.data?.dishes[index];

                    if (!isDishVisible(dish)) {
                      return SizedBox();
                    }
                    return Padding(
                      padding: const EdgeInsets.all(
                          8.0), // Add padding around the container
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Colors.grey),
                              // color: Colors.grey,
                              child: InkWell(
                                child: Image.network(
                                  dish?.imageUrl ?? '',
                                  width: double.infinity,
                                  //fit: BoxFit.cover,
                                  height: 300,
                                ),
                                onTap: () async {
                                  return showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Dialog(
                                          child: Container(
                                            width: double.infinity,
                                            height: 500,
                                            child: Stack(
                                              children: [
                                                Column(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Image.network(
                                                        dish?.imageUrl ?? '',
                                                        height: 200,
                                                      ),
                                                    ),
                                                    Text(
                                                      dish?.name ?? '',
                                                      textAlign: TextAlign.end,
                                                    ),
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 6,
                                                        ),
                                                        Text(
                                                          dish?.price
                                                                  .toString() ??
                                                              '',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        SizedBox(
                                                          width: 6,
                                                        ),
                                                        Text(
                                                          dish?.weight
                                                                  .toString() ??
                                                              '',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        dish?.description ?? '',
                                                        textAlign:
                                                            TextAlign.start,
                                                      ),
                                                    ),
                                                    ElevatedButton(
                                                        onPressed: () {
                                                          final cartModel =
                                                              Provider.of<
                                                                      CartModel>(
                                                                  context,
                                                                  listen:
                                                                      false);
                                                          cartModel
                                                              .addToFavorites(
                                                                  dish!);
                                                        },
                                                        child: Text(
                                                            'Add to favourite'))
                                                  ],
                                                ),
                                                Positioned(
                                                  top: 8,
                                                  right: 8,
                                                  child: Row(
                                                    children: [
                                                      IconButton(
                                                        icon: Icon(Icons
                                                            .favorite_outline),
                                                        onPressed: () {
                                                          // Handle edit button pressed
                                                        },
                                                      ),
                                                      IconButton(
                                                        icon: Icon(Icons.clear),
                                                        onPressed: () {
                                                          // Handle delete button pressed
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                },
                              ),
                            ),
                          ),
                          Text(
                            dish?.name ?? '',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            maxLines: 2, // Set maximum lines for the text
                            overflow: TextOverflow
                                .ellipsis, // Use ellipsis for overflow
                            textAlign: TextAlign.left, // Center-align the text
                          ),
                        ],
                      ),
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        context.go('/favs');
      }),
    );
  }
}
