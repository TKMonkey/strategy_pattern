import 'package:flutter_test/flutter_test.dart';
import 'package:strategy_pattern/inventory_listing/Item.dart';
import 'package:strategy_pattern/inventory_listing/strategy/decorators/sort_copy_decorator.dart';
import 'package:strategy_pattern/inventory_listing/strategy/decorators/sort_descending_decorator.dart';
import 'package:strategy_pattern/inventory_listing/strategy/inventory_listing.dart';
import 'package:strategy_pattern/inventory_listing/strategy/sort_by_name.dart';

void main() {
  group("Sort Copy Decorator", () {
    test("should return a different copy from the original array", () {
      // Arrange
      final List<Item> items = <Item>[
        Item("Item 4", 101),
        Item("Item 5", 800),
        Item("Item 9", 10),
        Item("Item 3", 150),
        Item("Item 2", 120),
        Item("Item 8", 600),
        Item("Item 6", 180),
        Item("Item 1", 100),
        Item("Item 7", 140),
      ];

      final InventoryListing inventoryListing = InventoryListing(items);
      final sortCopyStrategy =
          SortDescendingDecorator(SortCopyDecorator(SortByName()));

      // Act
      inventoryListing.currentSortType = sortCopyStrategy;
      final sortedItems = inventoryListing.readItems();

      //Assert
      final sameInstance = identical(items, sortedItems);
      expect(sameInstance, false);
    });
  });
}
