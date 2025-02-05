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
          PageView.builder(
            controller: controller,
            itemCount: pageArr.length,
            itemBuilder: (context, index) {
              var page = pageArr[index];
              return Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      page["image"],
                      width: 300,
                      height: 300,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      page["title"],
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      page["subtitle"],
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(pageArr.length, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: selectPage == index ? Colors.blue : Colors.grey,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
