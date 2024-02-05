import 'package:gihoc_mobile/components/coffeeTiles.dart';
import 'package:gihoc_mobile/components/dimensions.dart';
import 'package:gihoc_mobile/model/coffee.dart';
import 'package:gihoc_mobile/model/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  final CoffeeShop coffeeShop;

  const ShopPage({Key? key, required this.coffeeShop}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  //add to cart
  void addToCart(Coffee coffee) {
    //alert user that it has been added to cart
    Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);
    //alert user it has been added to cart
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text(
          "Successfully added to cart",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
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
              Text(
                "Which Product are you getting today?",
                style: GoogleFonts.oswald(fontSize: 20),
              ),
              SizedBox(
                height: Dimensions.height25,
              ),

              //list of coffees
              Expanded(
                  child: ListView.builder(
                itemCount: value.coffeeShop.length,
                itemBuilder: ((context, index) {
                  //get individual coffee
                  Coffee eachCoffee = value.coffeeShop[index];
                  //return tile for coffee
                  return CoffeeTile(
                    coffee: eachCoffee,
                    onPressed: () => addToCart(eachCoffee),
                    icon: const Icon(Icons.add),
                  );
                }),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
