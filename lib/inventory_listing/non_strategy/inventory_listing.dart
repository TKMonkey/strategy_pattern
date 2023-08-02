import 'package:strategy_pattern/inventory_listing/i_inventory_listing.dart';

import '../Item.dart';

enum InventorySortType {
  SORT_TYPE_NAME_ASC,
  SORT_TYPE_NAME_DESC,
  SORT_TYPE_PRICE_ASC,
  SORT_TYPE_PRICE_DESC,
}

class InventoryListing implements IInventoryListing<InventorySortType> {
  final List<Item> _items;
  InventoryListing(this._items);

  InventorySortType _currentSortType = InventorySortType.SORT_TYPE_NAME_ASC;

  set currentSortType(InventorySortType sortType) =>
      _currentSortType = sortType;

  List<Item> readItems() {
    final itemsCopy = List<Item>.from(_items);

    switch (_currentSortType) {
      case InventorySortType.SORT_TYPE_NAME_ASC:
        itemsCopy
            .sort((Item item1, Item item2) => item1.name.compareTo(item2.name));
        break;
      case InventorySortType.SORT_TYPE_NAME_DESC:
        itemsCopy
            .sort((Item item1, Item item2) => item2.name.compareTo(item1.name));
        break;
      case InventorySortType.SORT_TYPE_PRICE_ASC:
        itemsCopy.sort(
            (Item item1, Item item2) => item1.price.compareTo(item2.price));
        break;
      case InventorySortType.SORT_TYPE_PRICE_DESC:
        itemsCopy.sort(
            (Item item1, Item item2) => item2.price.compareTo(item1.price));
        break;
    }

    /**
     * Imagine it's a different sorting algorithm
     */

    return itemsCopy;
  }
}
