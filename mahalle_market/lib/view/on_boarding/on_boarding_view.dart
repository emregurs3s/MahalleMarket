import 'package:flutter/material.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  List pageArr = [
    {
      "title": "Mahallenizdeki Marketler Parmaklarınızın Ucunda!",
      "subtitle":
          "Yerel bakkal ve marketlere hızlıca ulaşın, ihtiyaçlarınızı kolayca karşılayın.",
      "image": "assets/onboarding1.png",
    },
    {
      "title": "Haritadan Keşfet, İletişime Geç!",
      "subtitle":
          "Mahallenizdeki işletmeleri haritada görüntüleyin ve anında iletişim kurun.",
      "image": "assets/onboarding2.png",
    },
    {
      "title": "Alışverişi Kolaylaştırın!",
      "subtitle":
          "Marketlerin sunduğu ürünleri inceleyin, ihtiyacınızı hızlıca bulun.",
      "image": "assets/onboarding3.png",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Splash Screen İçeriği
          Positioned.fill(
            child: Container(
              color: Colors.white, // Arka plan rengi
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo.png', // Uygulama logonuz
                    width: 150,
                    height: 150,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Mahalle Market",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Mahallenizdeki marketlere kolayca ulaşın!",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// Onboarding Ekranı (Splash'tan Sonra Görünecek)
          PageView.builder(
            itemCount: pageArr.length,
            itemBuilder: (context, index) {
              return Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      pageArr[index]["title"],
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      pageArr[index]["subtitle"],
                      style:
                          const TextStyle(fontSize: 16, color: Colors.black54),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Image.asset(
                      pageArr[index]["image"] ??
                          "assets/default.png", // Varsayılan resim
                      width: 250,
                      height: 250,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
