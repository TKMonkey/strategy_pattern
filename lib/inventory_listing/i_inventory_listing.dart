import 'Item.dart';

abstract class IInventoryListing<T> {
  set currentSortType(T sortType);

  List<Item> readItems();
}
