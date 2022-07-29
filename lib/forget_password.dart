import 'package:flutter/material.dart';
import 'package:user_auth/login.dart';
import 'package:user_auth/mailsend.dart';

class ForgotPassword extends StatelessWidget {
  static String id = 'forgot-password';

  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Email Your Email',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              TextFormField(
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Email',
                  icon: Icon(
                    Icons.mail,
                    color: Colors.white,
                  ),
                  errorStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                  hintStyle: TextStyle(color: Colors.white),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Send Email'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Page2()));
                },
              ),
              TextButton(
                child: const Text('Sign In'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const login()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
