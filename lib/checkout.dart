import 'package:flutter/material.dart';
import 'package:gihoc_mobile/components/dimensions.dart';
import 'package:gihoc_mobile/model/coffee.dart';
import 'package:gihoc_mobile/payment/payment_home.dart';

class CheckoutPage extends StatelessWidget {
  final List<Coffee> purchasedItems;

  const CheckoutPage({Key? key, required this.purchasedItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create Dimensions instance
    final dim = Dimensions(context);

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
            for (var item in purchasedItems)
              ListTile(
                title: Text(item.name),
                subtitle: Text('${item.price} x ${item.quantity}'),
                leading: Image.asset(item.imagePath),
              ),
            SizedBox(height: dim.height20),
            Text('Total Quantity: $totalQuantity'),
            SizedBox(height: dim.height5),
            Text(
              'Total Price: GH₵ ${totalPrice.toStringAsFixed(2)}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: dim.height5),
            const Text(
              'Confirm and complete your order.',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: dim.height10),
            GestureDetector(
              onTap: () {
                payNow(context);
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                width: dim.width150,
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
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PaymentPageHome()),
    );
  }
}
