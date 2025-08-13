import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:gihoc_mobile/components/coffee_tiles.dart';
import 'package:gihoc_mobile/components/dimensions.dart';
import 'package:gihoc_mobile/model/coffee.dart';
import 'package:gihoc_mobile/model/coffee_shop.dart';

class ShopPage extends StatefulWidget {
  final CoffeeShop coffeeShop;

  const ShopPage({Key? key, required this.coffeeShop}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addToCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          "Successfully added to cart",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        content: Text("${coffee.name} has been added to your cart."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final dimensions = Dimensions(context); // ✅ Create instance with context

    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: EdgeInsets.all(dimensions.height25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Which product are you getting today?",
                style: GoogleFonts.oswald(fontSize: dimensions.font20),
              ),
              SizedBox(height: dimensions.height25),

              Expanded(
                child: ListView.builder(
                  itemCount: value.coffeeShop.length,
                  itemBuilder: (context, index) {
                    Coffee eachCoffee = value.coffeeShop[index];
                    return CoffeeTile(
                      coffee: eachCoffee,
                      onPressed: () => addToCart(eachCoffee),
                      icon: const Icon(Icons.add),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
