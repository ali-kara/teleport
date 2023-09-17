import 'package:flutter/material.dart';
import 'package:teleport/services/signin_with_google.dart';
import 'package:teleport/widgets/custom_button.dart';

class LoginScreen extends StatelessWidget {
  final SignedInWithGoogle _signedInWithGoogle = SignedInWithGoogle();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Start or Join the Meeting',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 38.0),
            child: Image.asset('assets/images/onboarding.jpg'),
          ),
          CustomButton(
            buttonText: 'Google Sign In',
            onPressed: () async {
              bool res = await _signedInWithGoogle.signInWithGoogle(context);
              if (res) {
                Navigator.pushNamed(context, '/home');
              }
            },
          ),
        ],
      ),
    );
  }
}
