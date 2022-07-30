import 'package:flutter/material.dart';
import 'package:user_auth/form.dart' as grivence;
import 'package:user_auth/login.dart';
import 'package:user_auth/screens/signin_screen.dart';

class NewHomeScreen extends StatefulWidget {
  const NewHomeScreen({Key? key}) : super(key: key);

  @override
  State<NewHomeScreen> createState() => _NewHomeScreenState();
}

class _NewHomeScreenState extends State<NewHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const grivence.Form()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.person),
                    Text("COMPLAINT BOX"),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignInScreen()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.business),
                    Text("COMPLAINT MANAGER"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
