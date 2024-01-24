import 'package:gihoc_mobile/login_page.dart';
import 'package:gihoc_mobile/model/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CoffeeShop(),
        builder: (context, child) => const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: LoginPage(),
              // HomePage(),
            ));
  }
}
