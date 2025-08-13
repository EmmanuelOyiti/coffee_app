import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gihoc_mobile/components/dimensions.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> passwordReset() async {
    final email = _emailController.text.trim();

    if (email.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          content: Text("Please enter your email address."),
        ),
      );
      return;
    }

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      if (mounted) {
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            content: Text("Password reset link sent! Check your email."),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Text(e.message ?? "An error occurred. Try again."),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Text("Error: ${e.toString()}"),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final dimensions = Dimensions(context); // ✅ create an instance using context

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "Enter your email and you will receive a password reset link",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(height: dimensions.height10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: "Email",
                fillColor: Colors.grey[200],
                filled: true,
              ),
            ),
          ),
          SizedBox(height: dimensions.height10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: MaterialButton(
              onPressed: passwordReset,
              color: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: dimensions.height10),
                child: const Text(
                  "Reset Password",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
