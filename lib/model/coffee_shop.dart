import 'package:flutter/material.dart';
import 'coffee.dart';

class CoffeeShop extends ChangeNotifier {
  //coffee menu
  final List<Coffee> _shop = [
    Coffee(
        name: "Long Black",
        price: "5.2",
        imagePath: "assets/images/hot-coffee.png"),
    Coffee(
        name: "Iced Coffee",
        price: "5.2",
        imagePath: "assets/images/expresso.png"),
    Coffee(
        name: "Expresso",
        price: "5.2",
        imagePath: "assets/images/coffee-cup.png"),
    Coffee(
        name: "Latte", price: "5.2", imagePath: "assets/images/coffee-mug.png"),
  ];

  //user cart
  final List<Coffee> _userCart = [];

  //get coffee list
  List<Coffee> get coffeeShop => _shop;

  //get user cart
  List<Coffee> get userCart => _userCart;

  //add item to cart
  void addItemToCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  //remove item from cart
  void removeFromCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }
}
