import 'package:coffee_app/checkout.dart';
import 'package:flutter/material.dart';
import 'package:coffee_app/components/coffeeTiles.dart';
import 'package:coffee_app/model/coffee.dart';
import 'package:coffee_app/model/coffee_shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  //remove from cart
  void removeFromCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).removeFromCart(coffee);
    showDialog(
      context: context,
      builder: (
        context,
      ) =>
          const AlertDialog(
        title: Text(
          " Removed from cart ",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  void payNow() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              CheckoutPage(purchasedItems: Provider.of<CoffeeShop>(context, listen: false).userCart)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
        builder: (context, value, child) => SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  //heading
                  const Text(
                    "Your cart",
                    style: TextStyle(fontSize: 20),
                  ),
                  //list of cart
                  Expanded(
                    child: ListView.builder(
                        itemCount: value.userCart.length,
                        itemBuilder: (context, index) {
                          //get individual coffee items
                          Coffee eachCoffee = value.userCart[index];

                          //return coffee tile
                          return CoffeeTile(
                              coffee: eachCoffee,
                              onPressed: () => removeFromCart(eachCoffee),
                              icon: const Icon(Icons.delete));
                        }),
                  ),
                  GestureDetector(
                    onTap: payNow,
                    child: Container(
                      padding: const EdgeInsets.all(25),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.brown,
                          borderRadius: BorderRadius.circular(12)),
                      child: const Center(
                        child: Text(
                          "Pay now",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )));
  }
}
