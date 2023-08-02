import 'package:strategy_pattern/inventory_listing/Item.dart';
import 'package:strategy_pattern/inventory_listing/i_inventory_listing.dart';
import 'package:strategy_pattern/inventory_listing/strategy/decorators/sort_copy_decorator.dart';
import 'package:strategy_pattern/inventory_listing/strategy/i_sorting_strategy.dart';
import 'package:strategy_pattern/inventory_listing/strategy/sort_by_name.dart';

class InventoryListing implements IInventoryListing<ISortingStrategy> {
  final List<Item> _items;
  ISortingStrategy _currentSortingStrategy = SortCopyDecorator(SortByName());

  InventoryListing(this._items);

  @override
  set currentSortType(ISortingStrategy sortType) =>
      _currentSortingStrategy = sortType;

  @override
  List<Item> readItems() => _currentSortingStrategy.sort(_items);
}
