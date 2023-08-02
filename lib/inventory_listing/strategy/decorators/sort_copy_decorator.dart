import 'package:strategy_pattern/inventory_listing/Item.dart';
import 'package:strategy_pattern/inventory_listing/strategy/i_sorting_strategy.dart';

class SortCopyDecorator implements ISortingStrategy {
  final ISortingStrategy _decorated;

  SortCopyDecorator(this._decorated);

  @override
  List<Item> sort(List<Item> items) => _decorated.sort(List<Item>.from(items));
}
