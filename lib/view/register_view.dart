import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../constants.dart';
import '../helper/show_snack_Bar_helper.dart';
import '../widget/custom_button_widget.dart';
import '../widget/custom_from_textfield_widget.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  static String id = 'RegisterView';

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
                  const Text(
                    'KnK CHAT',
                    style: TextStyle(color: Colors.white, fontSize: 28),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  const Row(
                    children: [
                      Text(
                        'Register',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
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
                          await registerUser();
                          Navigator.pop(context);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            showSnackBar(context, 'weak password');
                          } else if (e.code == 'email-already-in-use') {
                            showSnackBar(context, 'email already in use');
                          }
                        } catch (e) {
                          showSnackBar(context, '$e');
                        }
                        isLoading = false;
                        setState(() {});
                      } else {}
                    },
                    text: 'Register',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        ' have an accunt? ',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          ' Login',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
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

  Future<void> registerUser() async {
    final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
