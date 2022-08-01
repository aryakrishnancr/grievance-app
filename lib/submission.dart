import 'package:flutter/material.dart';
import 'package:user_auth/user_auth.dart';

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
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: NetworkImage(
                  "https://cdn.dribbble.com/users/125948/screenshots/1792683/thankyoucontactdribbble.gif"),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
