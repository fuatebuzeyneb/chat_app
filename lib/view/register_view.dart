import 'package:flutter/material.dart';

import '../widget/custom_button_widget.dart';
import '../widget/custom_textfield_widget.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.10,
              ),
              Image.asset(
                'assets/images/chat_image.png',
                height: size.height * 0.30,
                width: size.height * 0.30,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('KNK CHAT'),
              SizedBox(
                height: size.height * 0.05,
              ),
              const Row(
                children: [
                  Text('Register'),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomTextFieldWidget(
                text: 'Name',
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomTextFieldWidget(
                text: 'Password',
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomButtonWidget(
                text: 'Register',
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('dont\'t have an accunt? '),
                  Text(' Register'),
                ],
              ),
              SizedBox(
                height: size.height * 0.20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
