import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

import '../../model/coffee_shop.dart';
import '../../pages/cart_page.dart';
import '../../pages/shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final user = FirebaseAuth.instance.currentUser!;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    ShopPage(coffeeShop: CoffeeShop()),
    const CartPage(),
  ];

  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error signing out: $e")),
      );
      return;
    }

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Signed out successfully")),
    );

    // Optional: Navigate to login
    // Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          user.email ?? "Guest",
          style: GoogleFonts.lato(fontSize: 20),
        ),
        backgroundColor: Colors.grey[350],
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            padding: const EdgeInsets.only(right: 20.0),
            onPressed: _signOut,
          ),
        ],
      ),
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: BottomNavBar(
        onTabChange: navigateBottomBar,
      ),
      body: _pages[_selectedIndex],
    );
  }
}

class BottomNavBar extends StatelessWidget {
  final void Function(int)? onTabChange;
  const BottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(127),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Consumer<CoffeeShop>(
        builder: (context, value, child) => GNav(
          onTabChange: onTabChange,
          color: Colors.grey[400],
          mainAxisAlignment: MainAxisAlignment.center,
          activeColor: Colors.grey[700],
          tabBackgroundColor: Colors.grey.shade300,
          tabBorderRadius: 23,
          tabActiveBorder: Border.all(color: Colors.white),
          tabs: [
            const GButton(
              icon: Icons.home,
              text: "Shop",
            ),
            GButton(
              icon: Icons.shopping_bag_outlined,
              text:
                  "Cart (${value.userCart.length} ${value.userCart.length == 1 ? 'item' : 'items'})",
            ),
          ],
        ),
      ),
    );
  }
}
