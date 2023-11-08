import 'package:chat_app/view/register_view.dart';
import 'package:chat_app/widget/custom_textfield_widget.dart';
import 'package:flutter/material.dart';

import '../widget/custom_button_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
                  Text('Login'),
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
                text: 'Login',
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('dont\'t have an accunt? '),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const RegisterView();
                      }));
                    },
                    child: const Text(' Register'),
                  ),
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
