import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        height: 1000,
        color: Colors.white,
        child: Center(
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
      ),
    );
  }
}
