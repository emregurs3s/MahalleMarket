import 'package:flutter/material.dart';
import 'package:mahalle_market/common/color_extensions.dart';
import 'package:mahalle_market/common_widget/round_button.dart';
import 'package:mahalle_market/view/login/new_password_view.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

class OtpView extends StatefulWidget {
  const OtpView({super.key});

  @override
  State<OtpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<OtpView> {
  final _otpPinFieldController = GlobalKey<OtpPinFieldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF03AB78),
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 60),
                  Text(
                    "Telefonunuza kod gönderdik",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: TColor.textfield,
                    ),
                  ),
                  Text(
                    "Lütfen 05******822 numaralı\n telefonunuza gelen kodu kontrol ediniz.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: TColor.textfield,
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    child: OtpPinField(
                      key: _otpPinFieldController,

                      ///in case you want to enable autoFill
                      autoFillEnable: false,

                      ///for Ios it is not needed as the SMS autofill is provided by default, but not for Android, that's where this key is useful.
                      textInputAction: TextInputAction.done,

                      ///in case you want to change the action of keyboard
                      /// to clear the Otp pin Controller
                      onSubmit: (text) {
                        debugPrint('Entered pin is $text');

                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                      onChange: (text) {
                        debugPrint('Enter on change pin is $text');

                        /// return the entered pin
                      },
                      onCodeChanged: (code) {
                        debugPrint('onCodeChanged  is $code');
                      },

                      /// to decorate your Otp_Pin_Field
                      otpPinFieldStyle: const OtpPinFieldStyle(
                        /// bool to show hints in pin field or not
                        showHintText: true,

                        /// to set the color of hints in pin field or not
                        // hintTextColor: Colors.red,

                        /// to set the text  of hints in pin field
                        // hintText: '1',

                        /// border color for inactive/unfocused Otp_Pin_Field
                        // defaultFieldBorderColor: Colors.red,

                        /// border color for active/focused Otp_Pin_Field
                        // activeFieldBorderColor: Colors.indigo,

                        /// Background Color for inactive/unfocused Otp_Pin_Field
                        // defaultFieldBackgroundColor: Colors.yellow,

                        /// Background Color for active/focused Otp_Pin_Field
                        // activeFieldBackgroundColor: Colors.cyanAccent,

                        /// Background Color for filled field pin box
                        // filledFieldBackgroundColor: Colors.green,

                        /// border Color for filled field pin box
                        // filledFieldBorderColor: Colors.green,
                        //
                        /// gradient border Color for field pin box
                        activeFieldBorderGradient: LinearGradient(
                            colors: [Colors.white, Colors.white]),
                        filledFieldBorderGradient: LinearGradient(
                            colors: [Colors.green, Colors.tealAccent]),
                        defaultFieldBorderGradient: LinearGradient(
                            colors: [Colors.white, Colors.white]),
                        fieldBorderWidth: 3,
                      ),
                      maxLength: 4,

                      /// no of pin field
                      showCursor: true,

                      /// bool to show cursor in pin field or not
                      cursorColor: Colors.indigo,

                      /// to choose cursor color
                      upperChild: const Column(
                        children: [
                          SizedBox(height: 30),
                          Icon(Icons.flutter_dash_outlined, size: 150),
                          SizedBox(height: 20),
                        ],
                      ),
                      // 123456

                      ///bool which manage to show custom keyboard
                      // showCustomKeyboard: true,

                      /// Widget which help you to show your own custom keyboard in place if default custom keyboard
                      // customKeyboard: Container(),
                      ///bool which manage to show default OS keyboard
                      // showDefaultKeyboard: true,

                      /// to select cursor width
                      cursorWidth: 3,

                      /// place otp pin field according to yourself
                      mainAxisAlignment: MainAxisAlignment.center,

                      /// predefine decorate of pinField use  OtpPinFieldDecoration.defaultPinBoxDecoration||OtpPinFieldDecoration.underlinedPinBoxDecoration||OtpPinFieldDecoration.roundedPinBoxDecoration
                      ///use OtpPinFieldDecoration.custom  (by using this you can make Otp_Pin_Field according to yourself like you can give fieldBorderRadius,fieldBorderWidth and etc things)
                      otpPinFieldDecoration:
                          OtpPinFieldDecoration.defaultPinBoxDecoration,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 440,
                    height: 50,
                    child: RoundButton(
                      title: "Devam",
                      onPressed: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      /* Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpView()));
                              */
                    },
                    child: Text(
                      "Kod gelmedi mi ? Buraya tıkla.",
                      style: TextStyle(
                          color: TColor.SecondaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
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
