import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shope/core/constants/app_colors.dart';
import 'package:shope/core/constants/app_text_style.dart';
import 'package:shope/core/utils/sized_box_extensions.dart';
import 'package:shope/gen/assets.gen.dart';
import 'package:shope/providers/image_provider.dart';
import 'package:shope/services/firebase_services/auth_service.dart';
import 'package:shope/services/firebase_services/user_service.dart';
import 'package:shope/widgets/buttons/confirmation_button.dart';
import 'package:shope/widgets/cutom_text_field/emailandpassword_textfield.dart';
import 'package:shope/widgets/cutom_text_field/phone_number_input.dart';
import 'package:shope/widgets/cutom_text_field/username_textfield.dart';
import 'package:shope/widgets/page_curves/sign_up_curves/blue_curves.dart';
import 'package:shope/widgets/page_curves/sign_up_curves/light_blue_curve.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  //instance of the auth service class
  final AuthService _auth = AuthService();
  final UserService _user = UserService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    phoneNumberController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ClipRect(
          clipBehavior: Clip.hardEdge,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: CustomPaint(
                  size: Size(228, 213),
                  painter: RPSCustomPainter(),
                ),
              ),
              Align(
                alignment: Alignment(1, -1),
                child: CustomPaint(
                  size: Size(92, 267),
                  painter: BlueSignUpCurveBackground(),
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                    bottom: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      70.height,
                      Text(
                        "Create \nAccount",
                        style: AppTextStyles.displayLarge(),
                      ),
                      40.height,
                      GestureDetector(
                        onTap: () {
                          context
                              .read<UserImageProvider>()
                              .pickImageFromGallery();
                        },
                        child: context.watch<UserImageProvider>().image != null
                            ? Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: FileImage(
                                      context.watch<UserImageProvider>().image!,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            : Assets.icons.uploadPhoto.image(),
                      ),
                      20.height,
                      EmailandPasswordTextfield(controller: emailController),
                      10.height,
                      EmailandPasswordTextfield(
                        controller: passwordController,
                        isPassword: true,
                      ),
                      10.height,
                      UsernameTextfield(controller: usernameController),
                      10.height,
                      PhoneNumberInput(controller: phoneNumberController),
                      10.height,
                      ConfirmationButton(
                        onPressed: () async {
                          try {
                            await _auth.createUserwithEmailandPassword(
                              emailController.text.trim(),
                              passwordController.text.trim(),
                            );
                            if (!context.mounted) return;
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Account created successfully"),
                              ),
                            );
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red,
                                content: Text("Error: $e"),
                              ),
                            );
                          }
                         await  _user.getUserDetails(
                            usernameController.text.trim(),
                            phoneNumberController.text.trim(),
                    
                          );
                        },
                        text: "Done",
                      ),
                      20.height,
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            //implement todo
                          },
                          child: Text(
                            "Cancel",
                            style: AppTextStyles.bodySmallLight(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
