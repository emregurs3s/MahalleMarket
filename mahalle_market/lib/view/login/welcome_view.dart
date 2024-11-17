import 'package:flutter/material.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // Arka Plan Görüntüsü
          Container(
            width: media.width,
            height: media.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/logo.png'),
                fit: BoxFit.cover, // Görüntüyü tam ekran yapar
              ),
            ),
          ),
          // Üst Katman (Mesaj)
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Hoş Geldiniz!',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Yazı rengini beyaz yap
                    shadows: [
                      Shadow(
                        offset: Offset(2, 2),
                        blurRadius: 4.0,
                        color: Colors.black, // Yazıya gölge ekler
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Uygulamamıza giriş yapın!',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white70, // Hafif beyaz tonlu yazı
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
