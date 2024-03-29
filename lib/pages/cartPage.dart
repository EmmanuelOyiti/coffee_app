import 'package:gihoc_mobile/checkout.dart';
import 'package:flutter/material.dart';
import 'package:gihoc_mobile/components/coffeeTiles.dart';
import 'package:gihoc_mobile/components/dimensions.dart';
import 'package:gihoc_mobile/model/coffee.dart';
import 'package:gihoc_mobile/model/coffee_shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeFromCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).removeFromCart(coffee);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              const Text(
                "Your cart",
                style: TextStyle(fontSize: 20),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: value.userCart.length,
                  itemBuilder: (context, index) {
                    Coffee eachCoffee = value.userCart[index];
                    return CoffeeTile(
                      coffee: eachCoffee,
                      onPressed: () => removeFromCart(eachCoffee),
                      icon: const Icon(Icons.delete),
                    );
                  },
                ),
              ),
              GestureDetector(
                onTap: payNow,
                child: Container(
                  margin: EdgeInsets.only(top: 20, bottom: 0),
                  padding: const EdgeInsets.all(15),
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      "Pay now",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void payNow() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => CheckoutPage(
              purchasedItems:
                  Provider.of<CoffeeShop>(context, listen: false).userCart)),
    );
  }
}
