import 'package:strategy_pattern/inventory_listing/Item.dart';
import 'package:strategy_pattern/inventory_listing/strategy/i_sorting_strategy.dart';

class SortByName implements ISortingStrategy {
  @override
  List<Item> sort(List<Item> items) {
    items.sort((Item item1, Item item2) => item1.name.compareTo(item2.name));
    return items;
  }
}
