import 'package:bahas_movie/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() => Container(
          margin: EdgeInsets.only(
            left: defaultMargin,
            bottom: 25,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sign In',
                style: primaryTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: semiBold,
                ),
              ),
              Text(
                'Please Sign In to Continue',
                style: tertiaryTextStyle.copyWith(
                  fontWeight: light,
                ),
              ),
            ],
          ),
        );

    Widget email() => Container(
          margin: EdgeInsets.only(
            left: defaultMargin,
            bottom: 25,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Email',
                style: primaryTextStyle,
              ),
              Container(
                height: 54,
                margin: EdgeInsets.only(top: 12, right: defaultMargin),
                decoration: BoxDecoration(
                  color: bgColor4,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 14),
                    child: TextFormField(
                      style: primaryTextStyle,
                      validator: (value) {
                        if (GetUtils.isEmail(value!)) {
                          return 'Email Not Valid';
                        } else {
                          null;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter Your Email',
                        hintStyle: secondaryTextStyle,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );

    Widget password() => Container(
          margin: EdgeInsets.only(
            left: defaultMargin,
            bottom: 25,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Password',
                style: primaryTextStyle,
              ),
              Container(
                height: 54,
                margin: EdgeInsets.only(top: 12, right: defaultMargin),
                decoration: BoxDecoration(
                  color: bgColor4,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 14),
                    child: TextFormField(
                      style: primaryTextStyle,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Enter Your Password',
                        hintStyle: secondaryTextStyle,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );

    Widget signInButton() => Center(
          child: Container(
            margin: const EdgeInsets.only(top: 25),
            height: 47,
            width: Get.width - 66 * 2,
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextButton(
              child: Text(
                'Sign In',
                style: primaryTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: medium,
                ),
              ),
              onPressed: () {
                Get.offAndToNamed('/home');
              },
            ),
          ),
        );

    Widget signUpText() => Container(
          margin: const EdgeInsets.only(top: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account? ",
                style: primaryTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: light,
                ),
              ),
              GestureDetector(
                child: Text(
                  'Sign Up',
                  style: tertiaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: light),
                ),
                onTap: () {
                  Get.toNamed('/register-page');
                },
              )
            ],
          ),
        );

    return Scaffold(
      backgroundColor: bgColor1,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/logo.png',
            width: 110,
            height: 114,
          ),
          // NOTE: HEADER
          header(),
          email(),
          password(),
          signInButton(),
          signUpText(),
        ],
      )),
    );
  }
}
