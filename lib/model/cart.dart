import 'package:flutter/material.dart';
import '../../model/product.dart';

class Cart extends ChangeNotifier {
  final List<ShopItem> items;

  int get checkoutAmount => items.fold(0, (previousValue, element) {
        if (element.isSelected) {
          previousValue += 1;
        }
        return previousValue;
      });

  addItem(ShopItem item) {
    items.add(item);
    notifyListeners();
  }

  Cart(this.items);

  int _findIndex(ShopItem item) => items.indexOf(item);

  addAmount(ShopItem item) {
    final index = _findIndex(item);
    items[index].shopAmount += 1;
    notifyListeners();
  }

  reduceAmount(ShopItem item) {
    final index = _findIndex(item);
    if (items[index].shopAmount == 1) {
      items.removeAt(index);
    } else {
      items[index].shopAmount -= 1;
    }
    notifyListeners();
  }

  select(ShopItem item) {
    final index = _findIndex(item);
    items[index].isSelected = !items[index].isSelected;
    notifyListeners();
  }
}

class ShopItem {
  final ProductDetail product;
  bool isSelected = true;
  int shopAmount = 1;

  ShopItem(this.product);
}
