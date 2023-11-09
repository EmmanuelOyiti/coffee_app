import 'package:coffee_app/components/coffeeTiles.dart';
import 'package:coffee_app/model/coffee.dart';
import 'package:coffee_app/model/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

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
      builder: (context) => AlertDialog(
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
                "How do you like your coffee?",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 25,
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
                    icon: Icon(Icons.add),
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
