import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:untitled/bloc/dishes_bloc/dishes_bloc.dart';
import 'package:untitled/bloc/dishes_bloc/dishes_bloc_even.dart';
import 'package:untitled/data/models/dishes.dart';
import 'package:untitled/presentation/widgets/error_widget.dart';
import 'package:untitled/providers/provider_dish.dart';
import 'package:untitled/providers/provider_tags.dart';

import '../../bloc/dishes_bloc/dishes_bloc_state.dart';

class DishesPages extends StatefulWidget {
  const DishesPages({Key? key}) : super(key: key);

  @override
  State<DishesPages> createState() => _DishesPagesState();
}

class _DishesPagesState extends State<DishesPages> {
  @override
  Widget build(BuildContext context) {
    var toggleValue = Provider.of<ToggleTags>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: BlocProvider(
        create: (context) => DishFilterBloc()..add(DishListEvent()),
        child: BlocBuilder<DishFilterBloc, DishFilterState>(
          builder: (context, state) {
            if (state is DishFilterLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is DishFilterError) {
              return ErrorSWidget();
            } else if (state is DishFilterFilteredLoaded) {
              return Column(children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: tegValues.map.entries.map((e) {
                        var tag = e.value;
                        var isSelected = toggleValue.selectedTags.contains(tag);

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FilterChip(
                            label: Text(e.key),
                            selected: isSelected,
                            onSelected: (bool value) {
                              toggleValue.toggleTag(tag);
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Expanded(
                    child: GridView.builder(
                  itemCount: state.dishesList.dishes.length,
                  itemBuilder: (BuildContext context, int index) {
                    var dish = state.dishesList.dishes[index];

                    if (!toggleValue.isDishVisible(dish)) {
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
                                      dish.imageUrl ?? '',
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
                                                            dish.imageUrl ?? '',
                                                        height: 200,
                                                      ),
                                                        ),
                                                        Text(
                                                          dish.name ?? '',
                                                      textAlign: TextAlign.end,
                                                    ),
                                                        Row(
                                                          children: [
                                                            SizedBox(
                                                              width: 6,
                                                            ),
                                                            Text(
                                                              dish.price
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
                                                              dish.weight
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
                                                            dish.description ?? '',
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
                                dish.name ?? '',
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
                ))
              ]);
            }
            return Text('data');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        context.go('/favs');
      }),
    );
  }
}

