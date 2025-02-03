import 'package:flutter/material.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int selectPage = 0;
  PageController controller = PageController();

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
  void initState() {
  
    super.initState();
    controller.addListener(() {
      setState(() {
        selectPage = controller.page?.floor() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(itemBuilder: (context, index) {
            return Container(
              alignment: Alignment.center,
              child: Image.asset(),
            );
          })
        ],
      ),
    );
  }
}
