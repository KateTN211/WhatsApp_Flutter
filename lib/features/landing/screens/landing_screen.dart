import 'package:flutter/material.dart';
import 'package:whatsapp_clone/features/auth/screens/out/login_screen.dart';
import 'package:whatsapp_clone/features/auth/screens/out/mail_screen_signin.dart';
import 'package:whatsapp_clone/features/auth/screens/out/mail_screen_signup.dart';
import 'package:whatsapp_clone/utils/colors.dart';
import 'package:whatsapp_clone/common/widgets/custom_button.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  void navigateToLoginScreen(BuildContext context) {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  void navigateToMailScreen(BuildContext context) {
    Navigator.pushNamed(context, MailScreen.routeName);
  }

  void navigateToMailScreenLogin(BuildContext context) {
    Navigator.pushNamed(context, MailScreenSignin.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            const Text(
              'Welcome to WhatsApp',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height / 9),
            Image.asset('assets/bg.png',
                height: 340, width: 340, color: tabColor),
            SizedBox(height: size.height / 9),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Read our Privacy Policy. Tap "Agree and continue" to accept the Terms of Service.',
                style: TextStyle(color: greyColor),
                textAlign: TextAlign.center,
              ),
            ),
            // const SizedBox(height: 10),
            // SizedBox(
            //   width: size.width * 0.75,
            //   child: CustomButton(
            //     onPressed: () => navigateToLoginScreen(context),
            //     text: 'AGREE AND CONTINUE',
            //   ),
            // ),
            const SizedBox(height: 10),
            SizedBox(
              width: size.width * 0.75,
              child: CustomButton(
                onPressed: () => navigateToMailScreen(context),
                text: 'EMAIL SIGN UP',
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: size.width * 0.75,
              child: CustomButton(
                onPressed: () => navigateToMailScreenLogin(context),
                text: 'EMAIL LOGIN',
              ),
            )
          ],
        ),
      ),
    );
  }
}
