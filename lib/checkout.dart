import 'package:flutter/material.dart';
import 'package:coffee_app/model/coffee.dart';

class CheckoutPage extends StatelessWidget {
  final List<Coffee> purchasedItems;

  const CheckoutPage({Key? key, required this.purchasedItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                subtitle: Text(item.price),
                leading: Image.asset(item.imagePath),
              ),
            SizedBox(height: 20),
            Text('Add your payment details and complete the order.'),
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:coffee_app/model/coffee_shop.dart';
// import 'package:coffee_app/model/coffee.dart';

// class CheckoutPage extends StatelessWidget {
//   final List<Coffee> purchasedItems;

//   const CheckoutPage({Key? key, required this.purchasedItems}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Checkout'),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Text(
//               'Purchased Items:',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: purchasedItems.length,
//               itemBuilder: (context, index) {
//                 Coffee coffee = purchasedItems[index];
//                 return ListTile(
//                   title: Text(coffee.name),
//                   subtitle: Text('\$${coffee.price}'),
//                   // You can customize this to show additional information
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: ElevatedButton(
//               onPressed: () {
//                 // Perform payment logic here
//                 // You can use the purchasedItems for further processing
//                 Provider.of<CoffeeShop>(context, listen: false)
//                     .removeAllFromCart(); // Clear the cart after payment
//                 Navigator.pop(context); // Go back to the previous screen
//               },
//               child: Text('Proceed to Payment'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
