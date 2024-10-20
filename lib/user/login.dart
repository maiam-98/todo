import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/home.dart';
import 'package:todo/user/register.dart';
import 'package:todo/user/validate.dart';

import '../widget/custom-button.dart';
import '../widget/custom-text-form-field.dart';
import '../widget/custom-text-tap.dart';
import '../widget/social-media.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var emailNode = FocusNode();

  var passwordNode = FocusNode();

  var isPass = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width / 15),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'مرحبا!',
                    style: GoogleFonts.amiri(fontSize: 55,fontWeight: FontWeight.w400),
                  ),
                   Text(
                    'سجل الدخول الى حسابك',
                    style: GoogleFonts.amiri(fontSize: 15,fontWeight: FontWeight.w100),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 20),
                  AppTextFormField(
                    keyboardType: TextInputType.emailAddress,
                    labelText: ' البريد الإلكتروني',
                    controller: emailController,
                    prefixIcon: const Icon(
                      Icons.email,
                      size: 20,
                    ),
                    //focusNode: emailNode,
                    onEnter: (value) {
                      FocusScope.of(context).requestFocus(passwordNode);
                    },
                    validate: (value) {
                      return validateEmail(value);
                    },
                  ),
                  const SizedBox(height: 10),
                  AppTextFormField(
                    keyboardType: TextInputType.text,
                    labelText: 'كلمة المرور',
                    controller: passwordController,
                    prefixIcon: const Icon(
                      Icons.password,
                      size: 20,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPass = !isPass;
                        });
                      },
                      icon: isPass ? const Icon(Icons.visibility,size: 20) : const Icon(Icons.visibility_off,size: 20) ,
                    ),
                    inputFormatter: [
                      LengthLimitingTextInputFormatter(8),
                    ],
                    focusNode: passwordNode,
                    scurePass: !isPass,
                    validate: (value) {
                      return validatePassword(value);
                    },
                  ),
                  TextTap(
                    context,
                    () {},
                    colorTap: Colors.grey,
                    textTap: 'هل نسيت كلمة المرور؟',
                    fixedText: '',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AppButton(
                      text: 'تسجيل الدخول',
                      context: context,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                        }
                      }),
                  TextTap(
                    context,
                    () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()));
                    },
                    colorTap: Colors.black,
                    textTap: 'اشترك',
                    fixedText: 'ليس لديك حساب؟',
                  ),
                  const Text('أو'),
                  const SizedBox(
                    height: 5,
                  ),
                  SocialMedia()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
