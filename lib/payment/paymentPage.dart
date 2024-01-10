import 'dart:convert';
import 'package:coffee_app/payment/apikeys.dart';
import 'package:coffee_app/payment/paystack/paystack_auth_response.dart';
import 'package:coffee_app/payment/transaction/transaction.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';

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
  // funct to init transaction
  Future<PaystackAuthResponse> createTransaction(
      Transaction transaction) async {
    const String url = "https://api.paystack.co/transaction/initialize";
    final data = transaction.toJson();

    try {
      final response = await http.post(Uri.parse(url),
          headers: {
            "Authorization": "Bearer ${Apikey.secretKey}",
            "Content-Type": "application/json"
          },
          body: jsonEncode(data));

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return PaystackAuthResponse.fromJson(responseData["data"]);
      } else {
        throw "Payment unsuccessful";
      }
    } on Exception {
      throw "Payment unsuccessful";
    }
  }

String checkIfUrlContainPrefixHttp(String url) {
  if (url.startsWith('http://') || url.startsWith('https://')) {
    return url;
  } else {
    return 'https://$url';
  }
}

Future<String> initializeTransaction() async {
  try {
    final price = double.parse(widget.amount);
    final transaction = Transaction(
      amount: (price * 100).toString(),
      reference: widget.reference,
      currency: "GHS",
      email: widget.email,
    );
    final authResponse = await createTransaction(transaction);
    return checkIfUrlContainPrefixHttp(authResponse.authorization_url);
  } catch (e) {
    print("Error initializing transaction: $e");
    return e.toString();
  }
}

// Future<String> initializeTransaction() async {
//   try {
//     final price = double.parse(widget.amount);
//     final transaction = Transaction(
//       amount: (price * 100).toString(),
//       reference: widget.reference,
//       currency: "GHS",
//       email: widget.email,
//     );
//     final authResponse = await createTransaction(transaction);
//     return checkIfUrlContainPrefixHttp(authResponse.authorization_url);
//   } catch (e) {
//     print("Error initializing transaction: $e");
//     return 'https://google.com'; 
//   }
// }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: FutureBuilder(
          future: initializeTransaction(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final url = snapshot.data;
                print("WebView URL: $url");
              return WebViewWidget(
                controller: WebViewController()
                  ..setJavaScriptMode(JavaScriptMode.unrestricted)
                  ..setBackgroundColor(const Color(0x00000000))
                  ..setNavigationDelegate(
                    NavigationDelegate(
                      onProgress: (int progress) {
                        // Update loading bar.
                      },
                      onPageStarted: (String url) {},
                      onPageFinished: (String url) {},
                      onWebResourceError: (WebResourceError error) {},
                      onNavigationRequest: (NavigationRequest request) {
                        if (request.url
                            .startsWith('https://www.youtube.com/')) {
                          return NavigationDecision.prevent;
                        }
                        return NavigationDecision.navigate;
                      },
                    ),
                  )
                  ..loadRequest(
                    Uri.parse(url!),
                  ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    ));
  }
}
