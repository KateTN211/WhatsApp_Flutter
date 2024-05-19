import 'package:flutter/material.dart';
import 'package:whatsapp_clone/common/widgets/custom_button.dart';
import 'package:country_picker/country_picker.dart';
import 'package:whatsapp_clone/utils/colors.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login-screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
        onSelect: (Country _country) {
          setState(() {
            country = _country;
          });
        });
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
              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () => pickCountry(),
                child: const Text(
                  'Pick your country',
                  style: TextStyle(color: messageColor),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0),
                  ),
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
                width: 90,
                child: CustomButton(
                  onPressed: () {},
                  text: 'NEXT',
                ),
              )
            ],
          ),
        ));
  }
}
