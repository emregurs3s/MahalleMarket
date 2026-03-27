import 'package:flutter/material.dart';
import 'package:mahalle_market/common/color_extensions.dart';
import 'package:mahalle_market/common_widget/round_button.dart';
import 'package:mahalle_market/common_widget/round_textfield.dart';
import 'package:mahalle_market/view/login/login_view.dart';

class NewPasswordView extends StatefulWidget {
  const NewPasswordView({super.key});

  @override
  State<NewPasswordView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<NewPasswordView> {
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtConfirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF03AB78),
      body: Stack(
        children: [
          Container(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 60),
                  Text(
                    "Şifre Yenileme",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: TColor.textfield,
                    ),
                  ),
                  Text(
                    "Lütfen oluşturmak istediğiniz yeni şifrenizi giriniz",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: TColor.textfield,
                    ),
                  ),
                  const SizedBox(height: 50),
                  RoundTextfield(
                    hintText: "Yeni Şifre",
                    controller: txtPassword,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 25),
                  RoundTextfield(
                    hintText: "Tekrar Yeni Şifre",
                    controller: txtConfirmPassword,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                    width: 440,
                    height: 50,
                    child: RoundButton(
                      title: "Gönder",
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                    ),
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
