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

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var rePasswordController = TextEditingController();

  var emailNode = FocusNode();

  var passwordNode = FocusNode();

  var rePasswordNode = FocusNode();

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
                    'إنشاء حساب',
                    style: GoogleFonts.amiri(fontSize: 50,fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 20),
                  AppTextFormField(
                    keyboardType: TextInputType.text,
                    labelText: 'الإسم',
                    controller: nameController,
                    onEnter: (value) {
                      FocusScope.of(context).requestFocus(emailNode);
                    },
                    prefixIcon: const Icon(Icons.person),
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'لا يجب ان يكون فارغ';
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  AppTextFormField(
                    keyboardType: TextInputType.emailAddress,
                    labelText: ' البريد الإلكتروني',
                    controller: emailController,
                    focusNode: emailNode,
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
                      icon: isPass
                          ? const Icon(Icons.visibility, size: 20)
                          : const Icon(Icons.visibility_off, size: 20),
                    ),
                    focusNode: passwordNode,
                    scurePass: !isPass,
                    validate: (value) {
                      return validatePassword(value);
                    },
                    onEnter: (value) {
                      FocusScope.of(context).requestFocus(rePasswordNode);
                    },
                    inputFormatter: [
                      LengthLimitingTextInputFormatter(8),
                    ],
                  ),
                  const SizedBox(height: 10),
                  AppTextFormField(
                    keyboardType: TextInputType.text,
                    labelText: 'تأكيد كلمة المرور',
                    controller: rePasswordController,
                    prefixIcon: const Icon(
                      Icons.password,
                      size: 20,
                    ),
                    focusNode: rePasswordNode,
                    scurePass: false,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'لا يجب ان يكون فارغا';
                      }
                      else if (value != passwordController.text) {
                        return 'يجب ان يكون متطابق مع كلمة المرور';
                      }
                    },
                    inputFormatter: [
                      LengthLimitingTextInputFormatter(8),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AppButton(
                      text: 'اشتراك',
                      context: context,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          print('heloo');
                        }
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_forward,size: 50),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
