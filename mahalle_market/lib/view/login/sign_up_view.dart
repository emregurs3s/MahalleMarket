import 'package:flutter/material.dart';
import 'package:mahalle_market/common/color_extensions.dart';
import 'package:mahalle_market/common_widget/round_button.dart';
import 'package:mahalle_market/common_widget/round_icon_button.dart';
import 'package:mahalle_market/common_widget/round_textfield.dart';
import 'package:mahalle_market/view/login/login_view.dart';
import 'package:mahalle_market/view/login/otp_view.dart';
import 'package:mahalle_market/view/login/reset_password_view.dart';

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
      backgroundColor: const Color(0xFF03AB78),
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "Kayıt Ol",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: TColor.textfield,
                    ),
                  ),
                  Text(
                    "Kayıt olmak için bilgilerinizi giriniz",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: TColor.textfield,
                    ),
                  ),
                  const SizedBox(height: 25),
                  RoundTextfield(
                    hintText: "İsim",
                    controller: txtName,
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(height: 25),
                  RoundTextfield(
                    hintText: "Soyisim",
                    controller: txtSurname,
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(height: 25),
                  RoundTextfield(
                    hintText: "E-Posta",
                    controller: txtEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 25),
                  RoundTextfield(
                    hintText: "Doğum Tarihi",
                    controller: txtBirthdate,
                    keyboardType: TextInputType.datetime,
                  ),
                  const SizedBox(height: 25),
                  RoundTextfield(
                    hintText: "Telefon Numarası",
                    controller: txtPhone,
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 25),
                  RoundTextfield(
                    hintText: "Şifre",
                    controller: txtPassword,
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 440,
                    height: 50,
                    child: RoundButton(
                      title: "Kayıt Ol",
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const OtpView()));
                      },
                    ),
                  ),
                  const SizedBox(height: 45),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ResetPasswordView()));
                    },
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
