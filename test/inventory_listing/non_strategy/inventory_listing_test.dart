import 'package:flutter_test/flutter_test.dart';
import 'package:strategy_pattern/inventory_listing/Item.dart';
import 'package:strategy_pattern/inventory_listing/non_strategy/inventory_listing.dart';

void main() {
  group("Non-Strategy InventoryListing", () {
    test(
      "should return items sorted by name ascending by default",
      () {
        // Arrange
        final List<Item> items = <Item>[
          Item("Item 2", 120),
          Item("Item 4", 101),
          Item("Item 5", 800),
          Item("Item 3", 150),
          Item("Item 1", 100),
          Item("Item 6", 180),
          Item("Item 9", 10),
          Item("Item 8", 600),
          Item("Item 7", 140),
        ];

        final inventoryListing = InventoryListing(items);

        // Act
        final sortedItems = inventoryListing.readItems();

        //Assert
        final List<Item> expectedItems = <Item>[
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

        expect(sortedItems, expectedItems);
      },
    );

    test(
      "should return items sorted by name descending",
      () {
        // Arrange
        final List<Item> items = <Item>[
          Item("Item 2", 120),
          Item("Item 4", 101),
          Item("Item 5", 800),
          Item("Item 3", 150),
          Item("Item 1", 100),
          Item("Item 6", 180),
          Item("Item 9", 10),
          Item("Item 8", 600),
          Item("Item 7", 140),
        ];

        final inventoryListing = InventoryListing(items);

        // Act
        inventoryListing.currentSortType =
            InventorySortType.SORT_TYPE_NAME_DESC;
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
      },
    );

    test(
      "should return items sorted by price ascending",
      () {
        // Arrange
        final List<Item> items = <Item>[
          Item("Item 2", 120),
          Item("Item 4", 101),
          Item("Item 5", 800),
          Item("Item 3", 150),
          Item("Item 1", 100),
          Item("Item 6", 180),
          Item("Item 9", 10),
          Item("Item 8", 600),
          Item("Item 7", 140),
        ];

        final inventoryListing = InventoryListing(items);

        // Act
        inventoryListing.currentSortType =
            InventorySortType.SORT_TYPE_PRICE_ASC;
        final sortedItems = inventoryListing.readItems();

        //Assert
        final List<Item> expectedItems = <Item>[
          Item("Item 9", 10),
          Item("Item 1", 100),
          Item("Item 4", 101),
          Item("Item 2", 120),
          Item("Item 7", 140),
          Item("Item 3", 150),
          Item("Item 6", 180),
          Item("Item 8", 600),
          Item("Item 5", 800),
        ];

        expect(sortedItems, expectedItems);
      },
    );

    test(
      "should return items sorted by price decending",
      () {
        // Arrange
        final List<Item> items = <Item>[
          Item("Item 2", 120),
          Item("Item 4", 101),
          Item("Item 5", 800),
          Item("Item 3", 150),
          Item("Item 1", 100),
          Item("Item 6", 180),
          Item("Item 9", 10),
          Item("Item 8", 600),
          Item("Item 7", 140),
        ];

        final inventoryListing = InventoryListing(items);

        // Act
        inventoryListing.currentSortType =
            InventorySortType.SORT_TYPE_PRICE_DESC;
        final sortedItems = inventoryListing.readItems();

        //Assert
        final List<Item> expectedItems = <Item>[
          Item("Item 5", 800),
          Item("Item 8", 600),
          Item("Item 6", 180),
          Item("Item 3", 150),
          Item("Item 7", 140),
          Item("Item 2", 120),
          Item("Item 4", 101),
          Item("Item 1", 100),
          Item("Item 9", 10),
        ];

        expect(sortedItems, expectedItems);
      },
    );
  });
}
