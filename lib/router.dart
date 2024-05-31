import 'package:flutter/material.dart';
import 'package:whatsapp_clone/common/widgets/error.dart';
import 'package:whatsapp_clone/features/auth/screens/in/home_screen.dart';
import 'package:whatsapp_clone/features/auth/screens/out/login_screen.dart';
import 'package:whatsapp_clone/features/auth/screens/out/mail_screen_signin.dart';
import 'package:whatsapp_clone/features/auth/screens/out/mail_screen_signup.dart';
import 'package:whatsapp_clone/features/auth/screens/out/otp_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      );
    case OtpScreen.routeName:
      final verificationId = settings.arguments as String;
      return MaterialPageRoute(
        builder: (context) => OtpScreen(
          verificationId: verificationId,
        ),
      );
    case MailScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const MailScreen(),
      );
    case MailScreenSignin.routeName:
      return MaterialPageRoute(
        builder: (context) => const MailScreenSignin(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );
    default:
      return MaterialPageRoute(
          builder: (context) => const Scaffold(
                body: ErrorScreen(error: 'This page doesn\'t exist.'),
              ));
  }
}
