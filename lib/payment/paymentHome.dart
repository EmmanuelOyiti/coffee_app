import 'package:gihoc_mobile/payment/paymentPage.dart';
import 'package:flutter/material.dart';

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
    debugShowCheckedModeBanner:
    false;
    return Scaffold(
      appBar: AppBar(
        title: Text("Momo Payment"),
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(1),
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
                decoration: InputDecoration(
                  labelText: "Amount",
                  hintText: "Enter Amount",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: refernceController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Required field empty";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Reference",
                  hintText: "Enter Reference",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Required field empty";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Enter Your Email",
                  border: OutlineInputBorder(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                        onPressed: () {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PaymentPage(
                                        amount: amountController.text,
                                        email: emailController.text,
                                        reference: refernceController.text,
                                      )));
                        },
                        child: Text("Proceed to payment"))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
