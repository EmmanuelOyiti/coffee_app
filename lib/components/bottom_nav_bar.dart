import 'package:gihoc_mobile/model/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:gihoc_mobile/model/coffee_shop.dart';

class BottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  final CoffeeShop coffeeShop; // Add coffeeShop property

  BottomNavBar({Key? key, required this.onTabChange, required this.coffeeShop})
      : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      child: Consumer<CoffeeShop>(
        builder: (context, value, child) => GNav(
          onTabChange: (value) => onTabChange!(value),
          color: Colors.grey[400],
          mainAxisAlignment: MainAxisAlignment.center,
          activeColor: Colors.grey[700],
          tabBackgroundColor: Colors.grey.shade300,
          tabBorderRadius: 23,
          tabActiveBorder: Border.all(color: Colors.white),
          tabs: [
            GButton(
              icon: Icons.home,
              text: "Shop",
            ),
            GButton(
              icon: Icons.shopping_bag_outlined,
              text:
                  "Cart (GH₵{value.userCart.length})", // Use value from Consumer
            ),
          ],
        ),
      ),
    );
  }
}
