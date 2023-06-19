import 'package:untitled/data/models/dishes.dart';

abstract class DishFilterEvent {}

class TagSelected extends DishFilterEvent {
  final Dishes selectedTag;

  TagSelected(this.selectedTag);
}
