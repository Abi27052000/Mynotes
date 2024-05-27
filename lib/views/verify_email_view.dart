import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/constants/routes.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Verify Email'),
          backgroundColor: Colors.blue,
          centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
                "An email has been sent to your email address. Please verify your email."),
            const Text(
                "If you havent received the email, press the button below to resend it."),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () async {
                final user = FirebaseAuth.instance.currentUser;

                await user?.sendEmailVerification();
              },
              child: const Text('Send verification email'),
            ),
            TextButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(registerRoute, (route) => false);
                },
                child: const Text('Restart'))
          ],
        ),
      ),
    );
  }
}
