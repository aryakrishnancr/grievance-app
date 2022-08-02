import 'package:flutter/material.dart';
import 'package:user_auth/user_auth.dart';
import 'package:lottie/lottie.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(seconds: 4),
        () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const NewHomeScreen()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Lottie.network(
              'https://assets6.lottiefiles.com/packages/lf20_3p2mgrek.json')), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
