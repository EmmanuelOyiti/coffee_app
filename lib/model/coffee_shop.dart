import 'package:flutter/material.dart';
import 'coffee.dart';
import 'package:collection/collection.dart';

class CoffeeShop extends ChangeNotifier {
  //coffee menu
  final List<Coffee> _shop = [
    Coffee(
        name: "Madingo", price: "5.2", imagePath: "assets/images/Madingo.png"),
    Coffee(
        name: "Castle Bridge",
        price: "5.2",
        imagePath: "assets/images/expresso.png"),
    Coffee(
        name: "Herb Afrik",
        price: "5.2",
        imagePath: "assets/images/afrikPremium.png"),
    Coffee(
        name: "Takai", price: "5.2", imagePath: "assets/images/coffee-mug.png"),
  ];

  //user cart
  final List<Coffee> _userCart = [];

  final Map<Coffee, int> _cartQuantity = {};

  //get coffee list
  List<Coffee> get coffeeShop => _shop;

  //get user cart
  List<Coffee> get userCart => _userCart;

  int getQuantityInCart(Coffee coffee) => _cartQuantity[coffee] ?? 0;

  //add item to cart
  void addItemToCart(Coffee coffee) {
    Coffee? existingItem = _userCart.firstWhereOrNull((item) => item.name == coffee.name);

  if (existingItem != null) {
    // Item is already in the cart, increase the quantity
    existingItem.quantity++;
  } else {
    // Item is not in the cart, add it
    _userCart.add(coffee);
  }

  }
   

 
  //remove item from cart
  void removeFromCart(Coffee coffee) {
      Coffee? existingItem = _userCart.firstWhereOrNull((item) => item == coffee);

  if (existingItem != null) {
    // Item is in the cart, reduce the quantity
    if (existingItem.quantity > 1) {
      existingItem.quantity--;  // Decrease the quantity
    } else {
      // If the quantity is 1, remove the item from the cart
      _userCart.remove(coffee);
    }

    notifyListeners();
    }
  }
}
