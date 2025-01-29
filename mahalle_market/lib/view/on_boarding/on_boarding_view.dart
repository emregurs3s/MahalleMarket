import 'package:flutter/material.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  List pageArr = [
    {"title": "", "subtitle": "", "image": ""},
    {
      "title": "",
      "subtitle": "",
      "image": "",
    },
    {
      "title": "",
      "subtitle": "",
      "image": "",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [PageView.builder(itemBuilder: ((context, index) {}))],
    ));
  }
}
