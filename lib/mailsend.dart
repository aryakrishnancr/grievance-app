import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
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
                    "https://i.pinimg.com/originals/af/8d/9a/af8d9ac62dd43026957e1cf82a027637.gif"),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
