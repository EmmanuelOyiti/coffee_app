import 'package:flutter/material.dart';
import 'coffee.dart';
import 'package:collection/collection.dart';

class CoffeeShop extends ChangeNotifier {
  //coffee menu
  final List<Coffee> _shop = [
    Coffee(
        name: "Takai", price: " 85.0 ", imagePath: "assets/images/takai.png"),
    Coffee(
        name: "Madingo",
        price: " 65.25 ",
        imagePath: "assets/images/Madingo.png"),
    Coffee(
        name: "Herb-Afrik Premium",
        price: " 65.2 ",
        imagePath: "assets/images/afrikPremium.png"),
    Coffee(
        name: "Apet Premium",
        price: " 65.2 ",
        imagePath: "assets/images/apetPremium.png"),
    Coffee(
        name: "Meridian", price: " 5.0 ", imagePath: "assets/images/water.png"),
    Coffee(
        name: "Apet Gin",
        price: " 45.2 ",
        imagePath: "assets/images/apetGin.png"),
  ];

  //user cart
  final List<Coffee> _userCart = [];

  final Map<Coffee, int> _cartQuantity = {};

  //get coffee list
  List<Coffee> get coffeeShop => _shop;

  //get user cart
  List<Coffee> get userCart => _userCart;

  int getQuantityInCart(Coffee coffee) => _cartQuantity[coffee] ?? 0;

  void addItemToCart(Coffee coffee) {
    Coffee? existingItem =
        _userCart.firstWhereOrNull((item) => item.name == coffee.name);

    if (existingItem != null) {
      // Item is already in the cart, increase the quantity
      existingItem.quantity++;
    } else {
      // Item is not in the cart, add it
      _userCart.add(coffee);
    }

    _cartQuantity[coffee] =
        getQuantityInCart(coffee); // Update quantity in _cartQuantity
    notifyListeners(); // Notify listeners after updating the cart
  }

  //remove item from cart
  void removeFromCart(Coffee coffee) {
    Coffee? existingItem = _userCart.firstWhereOrNull((item) => item == coffee);

    if (existingItem != null) {
      // Item is in the cart, reduce the quantity
      if (existingItem.quantity > 1) {
        existingItem.quantity--; // Decrease the quantity
      } else {
        // If the quantity is 1, remove the item from the cart
        _userCart.remove(coffee);
      }

      _cartQuantity[coffee] =
          getQuantityInCart(coffee); // Update quantity in _cartQuantity
      notifyListeners(); // Notify listeners after updating the cart
    }
  }

  double calculateTotal() {
    double total = 0.0;
    for (var coffee in _userCart) {
      total += double.parse(coffee.price) * coffee.quantity;
    }
    return total;
  }
}
