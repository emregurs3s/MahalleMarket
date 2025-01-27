import 'package:flutter/material.dart';
import 'package:mahalle_market/common/color_extensions.dart';
import 'package:mahalle_market/common_widget/round_button.dart';
import 'package:mahalle_market/common_widget/round_icon_button.dart';
import 'package:mahalle_market/common_widget/round_textfield.dart';
import 'package:mahalle_market/view/login/login_view.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtName = TextEditingController();
  TextEditingController txtSurname = TextEditingController();
  TextEditingController txtBirthdate = TextEditingController();
  TextEditingController txtPhone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  RoundTextfield(
                    hintText: "İsim",
                    controller: txtEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 20),
                  RoundTextfield(
                    hintText: "Soyisim",
                    controller: txtSurname,
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  RoundTextfield(
                    hintText: "E-Posta",
                    controller: txtEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 20),
                  RoundTextfield(
                    hintText: "Doğum Tarihi",
                    controller: txtPassword,
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  RoundTextfield(
                    hintText: "Telefon Numarası",
                    controller: txtEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 20),
                  RoundTextfield(
                    hintText: "Şifre",
                    controller: txtPassword,
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 150,
                    height: 40,
                    child: RoundButton(
                      title: "Giriş Yap",
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(height: 45),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Şifremi Unuttum",
                      style: TextStyle(
                          color: TColor.SecondaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: Text("Hesabınız var mı ? Giriş Yap.",
                          style: TextStyle(
                            color: TColor.SecondaryText,
                            fontSize: 14,
                          ))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
