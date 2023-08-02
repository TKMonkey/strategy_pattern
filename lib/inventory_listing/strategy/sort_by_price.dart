import 'package:strategy_pattern/inventory_listing/Item.dart';
import 'package:strategy_pattern/inventory_listing/strategy/i_sorting_strategy.dart';

class SortByPrice implements ISortingStrategy {
  @override
  List<Item> sort(List<Item> items) {
    items.sort((Item item1, Item item2) => item1.price.compareTo(item2.price));
    return items;
  }
}
