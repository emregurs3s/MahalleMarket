import 'package:flutter/material.dart';
import 'package:mahalle_market/common/color_extensions.dart';
import 'package:mahalle_market/common_widget/round_button.dart';
import 'package:mahalle_market/common_widget/round_textfield.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<ResetPasswordView> {
  TextEditingController txtEmail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF03AB78),
      body: Stack(
        children: [
          Container(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 60),
                  Text(
                    "Şifre Yenileme",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: TColor.textfield,
                    ),
                  ),
                  Text(
                    "E-postanızı girdikten sonra e-postanıza gelen linke tıklayarak yeni şifre oluşturunuz",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: TColor.textfield,
                    ),
                  ),
                  SizedBox(height: 50),
                  RoundTextfield(
                    hintText: "E-Posta",
                    controller: txtEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 25),
                  SizedBox(
                    width: 440,
                    height: 50,
                    child: RoundButton(
                      title: "Gönder",
                      onPressed: () {},
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
