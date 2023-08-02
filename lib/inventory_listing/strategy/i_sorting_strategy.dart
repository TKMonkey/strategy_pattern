import '../Item.dart';

abstract class ISortingStrategy {
  List<Item> sort(List<Item> items);
}
