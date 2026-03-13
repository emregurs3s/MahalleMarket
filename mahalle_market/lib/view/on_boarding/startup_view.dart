import 'package:flutter/material.dart';
import 'package:mahalle_market/view/login/login_view.dart';
import 'package:mahalle_market/view/login/welcome_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartupView(),
    );
  }
}

class StartupView extends StatefulWidget {
  const StartupView({super.key});

  @override
  State<StartupView> createState() => _StartupViewState();
}

class _StartupViewState extends State<StartupView> {
  @override
  void initState() {
    super.initState();
    goWelcomePage();
  }

  void goWelcomePage() async {
    await Future.delayed(const Duration(seconds: 2));
    WelcomePage();
  }

  void WelcomePage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const WelcomeView()));
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/img/logo.png",
            width: media.width,
            height: media.height,
            fit: BoxFit.cover,
          ),
          const CircularProgressIndicator(
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
