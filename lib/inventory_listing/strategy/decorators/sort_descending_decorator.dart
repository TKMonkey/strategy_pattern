import 'package:strategy_pattern/inventory_listing/Item.dart';
import 'package:strategy_pattern/inventory_listing/strategy/i_sorting_strategy.dart';

class SortDescendingDecorator implements ISortingStrategy {
  final ISortingStrategy _decorated;

  SortDescendingDecorator(this._decorated);

  @override
  List<Item> sort(List<Item> items) {
    final sorted = _decorated.sort(List<Item>.from(items));

    return sorted.reversed.toList();
  }
}
