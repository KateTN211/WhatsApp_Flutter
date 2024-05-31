import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/common/utils/show_snack_bar.dart';
import 'package:whatsapp_clone/common/widgets/custom_button.dart';
import 'package:country_picker/country_picker.dart';
import 'package:whatsapp_clone/features/auth/controller/auth_controller.dart';
import 'package:whatsapp_clone/features/auth/screens/out/otp_screen.dart';
import 'package:whatsapp_clone/utils/colors.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const routeName = '/login-screen';

  const LoginScreen({super.key});

  void navigateToOtpScreen(BuildContext context) {
    Navigator.pushNamed(context, OtpScreen.routeName);
  }

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final phoneController = TextEditingController();
  Country? country;
  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  void pickCountry() {
    showCountryPicker(
        context: context,
        onSelect: (Country country) {
          setState(() {
            country = country;
          });
        });
  }

  void sendPhoneNumber() {
    String phoneNumber = phoneController.text.trim();
    if (country != null && phoneNumber.isNotEmpty) {
      String formattedPhoneNumber = '+${country!.phoneCode}$phoneNumber';
      ref
          .read(authControllerProvider)
          .signInWithPhone(context, formattedPhoneNumber);
      //provider ref -> interact provider with provider
      //widget ref -> make widget interact with provider
    } else if (country == null) {
      showSnackBar(context, 'Please pick your country');
    } else {
      showSnackBar(context, 'Please enter a valid phone number!');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Enter your phone number',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        // backgroundColor: backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.only(top: 18.0)),
            const Text('WhatsApp will need to verify your number.'),
            const SizedBox(height: 5),
            TextButton(
              onPressed: () => pickCountry(),
              child: const Text(
                'Pick your country',
                style: TextStyle(color: messageColor),
              ),
            ),
            const SizedBox(height: 3),
            Row(
              children: [
                const Padding(padding: EdgeInsets.only(left: 16.0)),
                if (country != null) Text('(+${country!.phoneCode})'),
                const Padding(padding: EdgeInsets.only(left: 10.0)),
                const SizedBox(height: 10),
                SizedBox(
                  width: size.width * 0.7,
                  child: TextField(
                    controller: phoneController,
                    decoration:
                        const InputDecoration(hintText: 'your phone number'),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.55),
            SizedBox(
              width: 120,
              child: CustomButton(
                onPressed: sendPhoneNumber,
                text: 'Send OTP',
              ),
            )
          ],
        ),
      ),
    );
  }
}
