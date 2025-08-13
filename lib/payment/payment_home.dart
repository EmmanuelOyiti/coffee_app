import 'package:flutter/material.dart';
import 'package:gihoc_mobile/components/dimensions.dart';
import 'package:gihoc_mobile/payment/payment_page.dart';

class PaymentPageHome extends StatefulWidget {
  const PaymentPageHome({super.key});

  @override
  State<PaymentPageHome> createState() => _PaymentPageHomeState();
}

class _PaymentPageHomeState extends State<PaymentPageHome> {
  final _formKey = GlobalKey<FormState>();
  final amountController = TextEditingController();
  final refernceController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dim = Dimensions(context); 

    return Scaffold(
      appBar: AppBar(
        title: const Text("Momo Payment"),
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: amountController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Required field empty";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: "Amount",
                    hintText: "Enter Amount",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: dim.height15),
                TextFormField(
                  controller: refernceController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Required field empty";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: "Reference",
                    hintText: "Enter Reference",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: dim.height15),
                TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Required field empty";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: "Email",
                    hintText: "Enter Your Email",
                    border: OutlineInputBorder(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: dim.height45,
                    child: ElevatedButton(
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) return;

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentPage(
                              amount: amountController.text,
                              email: emailController.text,
                              reference: refernceController.text,
                            ),
                          ),
                        );
                      },
                      child: const Text("Proceed to payment"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
