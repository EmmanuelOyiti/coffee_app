import 'package:gihoc_mobile/payment/paymentHome.dart';
import 'package:flutter/material.dart';
import 'package:gihoc_mobile/model/coffee.dart';

class CheckoutPage extends StatelessWidget {
  final List<Coffee> purchasedItems;

  CheckoutPage({Key? key, required this.purchasedItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calculate total price and quantity
    double totalPrice = 0;
    int totalQuantity = 0;

    for (var item in purchasedItems) {
      totalPrice += double.parse(item.price) * item.quantity;
      totalQuantity += item.quantity;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Your purchased items:'),
            // Display the purchased items
            for (var item in purchasedItems)
              ListTile(
                title: Text(item.name),
                subtitle: Text('${item.price} x ${item.quantity}'),
                leading: Image.asset(item.imagePath),
              ),
            SizedBox(height: 20),
            // Display total price and quantity
            Text('Total Quantity: $totalQuantity'),
            SizedBox(
              height: 5,
            ),
            Text('Total Price: \GH₵ ${totalPrice.toStringAsFixed(2)}',
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(
              height: 5,
            ),
            Text(
              'Confirm and complete your order.',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                payNow(context); // Pass the context to payNow function
              },
              child: Container(
                padding: const EdgeInsets.all(25),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text(
                    "Pay now",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void payNow(BuildContext context) {
    // Navigate to the payment page (you can replace PaymentPageHome with your payment page)
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PaymentPageHome()),
    );
  }
}
