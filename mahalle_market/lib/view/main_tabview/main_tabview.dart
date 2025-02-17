import 'package:flutter/material.dart';

class MainTabview extends StatefulWidget {
  const MainTabview({super.key});

  @override
  State<MainTabview> createState() => _MainTabviewState();
}

class _MainTabviewState extends State<MainTabview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Image.asset(
          "mahalle_market/assets/img/home.png",
          width: 35,
          height: 35,
        ),
      ),
    );
  }
}
