import 'package:flutter/material.dart';
import 'package:mahalle_market/common/color_extensions.dart';
import 'package:mahalle_market/common_widget/round_button.dart';
import 'package:mahalle_market/view/login/login_view.dart';
import 'package:mahalle_market/view/login/sign_up_view.dart';

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
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/img/logo.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: media.width * 0.9,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45),
                    child: RoundButton(
                      title: "Giriş Yap",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                    )),
                SizedBox(
                  height: media.width * 0.06,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45),
                    child: RoundButton(
                      type: RoundButtonType.textPrimary,
                      title: "Kayıt Ol",
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpPage()));
                      },
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
