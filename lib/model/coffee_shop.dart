import 'package:flutter/material.dart';
import 'coffee.dart';

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
    if (_cartQuantity.containsKey(coffee)) {
      // If item is already in the cart, increment the quantity
      _cartQuantity[coffee] = _cartQuantity[coffee]! + 1;
    } else {
      // If item is not in the cart, add it with quantity 1
      _userCart.add(coffee);
      _cartQuantity[coffee] = 1;
    }

    // _userCart.add(coffee);
    notifyListeners();
  }

  //remove item from cart
  void removeFromCart(Coffee coffee) {
    if (_cartQuantity.containsKey(coffee)) {
      // If item is in the cart, decrement the quantity
      _cartQuantity[coffee] = _cartQuantity[coffee]! - 1;

      // If the quantity becomes zero, remove the item from the cart
      if (_cartQuantity[coffee] == 0) {
        _userCart.remove(coffee);
        _cartQuantity.remove(coffee);
      }

      notifyListeners();
    }
  }
}
