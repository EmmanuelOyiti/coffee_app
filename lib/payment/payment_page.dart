import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';

import 'package:gihoc_mobile/payment/apikeys.dart';
import 'package:gihoc_mobile/payment/paystack/paystack_auth_response.dart';
import 'package:gihoc_mobile/payment/transaction/transaction.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({
    super.key,
    required this.amount,
    required this.email,
    required this.reference,
  });

  final String amount;
  final String email;
  final String reference;

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  late Future<String> _transactionUrl;

  @override
  void initState() {
    super.initState();
    _transactionUrl = initializeTransaction();
  }

  Future<PaystackAuthResponse> createTransaction(Transaction transaction) async {
    const String url = "https://api.paystack.co/transaction/initialize";
    final data = transaction.toJson();

    final response = await http.post(
      Uri.parse(url),
      headers: {
        "Authorization": "Bearer ${Apikey.secretKey}",
        "Content-Type": "application/json"
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return PaystackAuthResponse.fromJson(responseData["data"]);
    } else {
      throw Exception("Payment initialization failed");
    }
  }

  String formatUrl(String url) {
    return url.startsWith('http://') || url.startsWith('https://')
        ? url
        : 'https://$url';
  }

  Future<String> initializeTransaction() async {
    try {
      final price = double.parse(widget.amount);
      final transaction = Transaction(
        amount: (price * 100).toStringAsFixed(0), // Paystack uses minor units
        reference: widget.reference,
        currency: "GHS",
        email: widget.email,
      );
      final authResponse = await createTransaction(transaction);
      return formatUrl(authResponse.authorizationUrl);
    } catch (e) {
      rethrow; // Will be handled in FutureBuilder
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<String>(
          future: _transactionUrl,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Text(
                    'Transaction failed: ${snapshot.error}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.red, fontSize: 16),
                  ),
                ),
              );
            } else if (snapshot.hasData) {
              final url = snapshot.data!;
              return WebViewWidget(
                controller: WebViewController()
                  ..setJavaScriptMode(JavaScriptMode.unrestricted)
                  ..setBackgroundColor(const Color(0x00000000))
                  ..setNavigationDelegate(
                    NavigationDelegate(
                      onProgress: (_) {},
                      onPageStarted: (_) {},
                      onPageFinished: (_) {},
                      onWebResourceError: (WebResourceError error) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Web error: ${error.description}")),
                        );
                      },
                      onNavigationRequest: (NavigationRequest request) {
                        if (request.url.contains("youtube.com")) {
                          return NavigationDecision.prevent;
                        }
                        return NavigationDecision.navigate;
                      },
                    ),
                  )
                  ..loadRequest(Uri.parse(url)),
              );
            } else {
              return const Center(child: Text("Unexpected error occurred"));
            }
          },
        ),
      ),
    );
  }
}
