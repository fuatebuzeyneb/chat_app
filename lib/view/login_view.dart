import 'package:chat_app/constants.dart';
import 'package:chat_app/view/chat_view.dart';
import 'package:chat_app/view/register_view.dart';
import 'package:chat_app/widget/custom_from_textfield_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../helper/show_snack_Bar_helper.dart';
import '../widget/custom_button_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  static String id = 'LoginView';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String? email;

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.10,
                  ),
                  Image.asset(
                    kLogo,
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
                  CustomTextFormFieldWidget(
                    onChanged: (data) {
                      email = data;
                    },
                    text: 'Email',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormFieldWidget(
                    onChanged: (data) {
                      password = data;
                    },
                    text: 'Password',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButtonWidget(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                        try {
                          await LoginUser();
                          Navigator.pushNamed(context, ChatView.id,
                              arguments: email);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            showSnackBar(
                                context, 'No user found for that email.');
                          } else if (e.code == 'wrong-password') {
                            showSnackBar(context,
                                'Wrong password provided for that user.');
                          }
                        } catch (e) {
                          showSnackBar(context, '$e');
                        }
                        isLoading = false;
                        setState(() {});
                      } else {}
                    },
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
                          Navigator.pushNamed(context, RegisterView.id);
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
        ),
      ),
    );
  }

  Future<void> LoginUser() async {
    final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
