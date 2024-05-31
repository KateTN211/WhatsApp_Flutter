import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone/common/widgets/custom_button.dart';
import 'package:whatsapp_clone/services/firebase_auth_methods.dart';
import 'package:whatsapp_clone/utils/colors.dart';

class MailScreenSignin extends StatefulWidget {
  static const routeName = '/mail-screen-signin';
  const MailScreenSignin({super.key});

  @override
  State<MailScreenSignin> createState() => _MailScreenSigninState();
}

class _MailScreenSigninState extends State<MailScreenSignin> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // void signinUser() {
  //   context.read<FirebaseAuthMethods>().loginWithEmail(
  //         email: emailController.text,
  //         password: passwordController.text,
  //         context: context,
  //       );
  // }
  void signinUser() {
    FirebaseAuthMethods(FirebaseAuth.instance).loginWithEmail(
        email: emailController.text,
        password: passwordController.text,
        context: context);
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   emailController.dispose();
  //   passwordController.dispose();
  // }

  // void navigateToHomeScreen(BuildContext context) {
  //   Navigator.pushNamed(context, HomeScreen.routeName);
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/bg.png',
                  height: 100,
                  width: 100,
                  color: tabColor,
                ),
                const SizedBox(height: 10.0),
                const Text(
                  'WhatsApp SIGN IN',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 20.0),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: ' Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  width: size.width * 0.75,
                  child: CustomButton(
                    onPressed: signinUser,
                    text: 'SIGN IN',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
