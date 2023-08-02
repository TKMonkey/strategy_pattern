import 'package:flutter_test/flutter_test.dart';
import 'package:strategy_pattern/inventory_listing/Item.dart';
import 'package:strategy_pattern/inventory_listing/strategy/decorators/sort_descending_decorator.dart';
import 'package:strategy_pattern/inventory_listing/strategy/inventory_listing.dart';
import 'package:strategy_pattern/inventory_listing/strategy/sort_by_name.dart';

void main() {
  group("Sort Descending Decorator", () {
    test("should return reversed sorted array", () {
      // Arrange
      final List<Item> items = <Item>[
        Item("Item 1", 100),
        Item("Item 2", 120),
        Item("Item 3", 150),
        Item("Item 4", 101),
        Item("Item 5", 800),
        Item("Item 6", 180),
        Item("Item 7", 140),
        Item("Item 8", 600),
        Item("Item 9", 10),
      ];

      final InventoryListing inventoryListing = InventoryListing(items);
      final sortCopyStrategy = SortDescendingDecorator(SortByName());

      // Act
      inventoryListing.currentSortType = sortCopyStrategy;
      final sortedItems = inventoryListing.readItems();

      //Assert
      final List<Item> expectedItems = <Item>[
        Item("Item 9", 10),
        Item("Item 8", 600),
        Item("Item 7", 140),
        Item("Item 6", 180),
        Item("Item 5", 800),
        Item("Item 4", 101),
        Item("Item 3", 150),
        Item("Item 2", 120),
        Item("Item 1", 100),
      ];

      expect(sortedItems, expectedItems);
    });
  });
}
