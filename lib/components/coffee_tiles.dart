import 'package:gihoc_mobile/model/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {
  final Coffee coffee;
  final Widget icon;
  final void Function()? onPressed; // Marked as final

  const CoffeeTile({
    super.key,
    required this.coffee,
    required this.onPressed,
    required this.icon,
  }); // Added const constructor

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: ListTile(
        title: Text(coffee.name),
        subtitle: Text('Price: GH₵${coffee.price}  Quantity: ${coffee.quantity}'),
        leading: Image.asset(coffee.imagePath),
        trailing: IconButton(
          icon: icon,
          onPressed: onPressed,
        ),
      ),
    );
  }
}