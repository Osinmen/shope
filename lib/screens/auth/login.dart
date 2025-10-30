import 'package:flutter/material.dart';
import 'package:shope/core/constants/app_text_style.dart';
import 'package:shope/core/utils/sized_box_extensions.dart';
import 'package:shope/services/firebase_services/auth_service.dart';
import 'package:shope/widgets/buttons/confirmation_button.dart';
import 'package:shope/widgets/cutom_text_field/emailandpassword_textfield.dart';
import 'package:shope/widgets/page_curves/login_curves/blue_curve.dart';
import 'package:shope/widgets/page_curves/login_curves/light_blue_curve.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -80,
              left: -40,
              child: SizedBox(
                width: 400,
                height: 400,
                child: CustomPaint(painter: RPSCustomPainter()),
              ),
            ),
            Positioned(
              top: -60,
              left: 0,
              child: SizedBox(
                width: 300,
                height: 300,
                child: CustomPaint(painter: RSCustomPainter()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Login", style: AppTextStyles.displayLarge()),
                    Text(
                      "Good to see you back!",
                      style: AppTextStyles.bodySmallLight(),
                    ),
                    10.height,
                    EmailandPasswordTextfield(controller: emailController),
                    20.height,
                    ConfirmationButton(onPressed: () async{
                      await _auth.loginUserWithEmailandPassword(emailController.text.trim(), passwordController.text.trim());
                    }, text: "Next"),
                    10.height,
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Cancel",
                        style: AppTextStyles.bodySmallLight(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
