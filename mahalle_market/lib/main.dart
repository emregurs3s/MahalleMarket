import 'package:flutter/material.dart';
import 'package:mahalle_market/view/home/home_view.dart';
import 'package:mahalle_market/view/main_tabview/main_tabview.dart';
import 'package:mahalle_market/common/color_extensions.dart';
import 'package:mahalle_market/view/on_boarding/on_boarding_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mahalle Market',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Metropolis",
        colorScheme: ColorScheme.fromSeed(seedColor: TColor.primary),
        useMaterial3: true,
      ),
      home: const OnBoardingView(),
    );
  }
}
