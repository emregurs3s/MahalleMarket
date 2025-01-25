import 'package:flutter/material.dart';
import 'package:mahalle_market/common/color_extensions.dart';
import 'package:mahalle_market/common_widget/round_button.dart';
import 'package:mahalle_market/common_widget/round_textfield.dart';
import 'package:mahalle_market/common_widget/round_icon_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/logo.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Hoşgeldiniz",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: TColor.textfield,
                    ),
                  ),
                  SizedBox(height: 80),
                  RoundTextfield(
                    hintText: "Kullanıcı Adı",
                    controller: txtEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 20),
                  RoundTextfield(
                    hintText: "Şifre",
                    controller: txtPassword,
                    obscureText: true,
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    width: 150,
                    height: 40,
                    child: RoundButton(
                      title: "Giriş Yap",
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Şifremi Unuttum",
                      style: TextStyle(
                          color: TColor.textfield,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "veya",
                    style: TextStyle(
                        color: TColor.SecondaryText,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      children: [
                        RoundIconButton(
                            title: "Facebook ile Giriş Yap",
                            icon: Icons.facebook,
                            color: Colors.blue,
                            onPressed: () {}),
                        SizedBox(height: 15),
                        RoundIconButton(
                            title: "Google ile Giriş Yap",
                            icon: Icons.g_mobiledata,
                            color: Colors.red,
                            onPressed: () {})
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  TextButton(
                    onPressed: () {},
                    child: Text("Hesabınız yok mu ? Kayıt ol."),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
