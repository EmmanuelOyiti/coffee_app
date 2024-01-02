import 'package:coffee_app/components/bottom_nav_bar.dart';
import 'package:coffee_app/pages/cartPage.dart';
import 'package:coffee_app/pages/shopPage.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'model/coffee_shop.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //navigate bottombar
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //pages
 final List<Widget> _pages = [
  ShopPage(coffeeShop: CoffeeShop()),  // or provide an existing CoffeeShop instance
  CartPage(),
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: BottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}

class BottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  BottomNavBar({super.key, required this.onTabChange});

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
              text: "Cart (${value.userCart.length})", // Show the cart count
            ),
          ],
        ),
      ),
    );
  }
}
