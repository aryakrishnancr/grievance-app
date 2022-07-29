import 'package:flutter/material.dart';
import 'package:user_auth/user_auth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
        body: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.network(
                'https://www.govqa.com/wp-content/uploads/2019/09/GovQA-Services-Complaints-Icon.png')));
  }
}
