import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/screens/login.dart';
import 'package:food_delivery/utils/kpass_text_form_field.dart';
import 'package:food_delivery/utils/ktext_form_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/color_constants.dart';
import '../utils/custom_widgets.dart';
import 'home.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  dynamic h, w;

  final formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Widget kSizedBox() {
    return SizedBox(
      height: h * 0.04,
    );
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Container(
          height: h,
          width: w,
          margin: EdgeInsets.symmetric(horizontal: w * 0.03),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                    child: CustomWidgets().titleText('Sign Up')
                ),
                SizedBox(
                  height: h * 0.06,
                ),
                CustomTextFormField(
                  h: h * 0.06,
                  w: w * 8,
                  controller: nameController,
                  hintText: 'Enter your name',
                  inputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if(value == null || value.isEmpty) {
                      return "Mandatory Fields";
                    } else if ( value.length > 15) {
                      return "Name should not be more than 15 characters";
                    }
                  },
                ),
                kSizedBox(),
                CustomTextFormField(
                  h: h * 0.06,
                  w: w * 8,
                  controller: emailController,
                  hintText: 'Enter your email-id',
                  inputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if(value == null || value.isEmpty) {
                      return "Mandatory Fields";
                    } else if (!(value.contains('@'))) {
                      return "Invalid Email Id. Must contain @";
                    }
                  },
                ),
                kSizedBox(),
                CustomPassTextFormField(
                  h: h * 0.06,
                  w: w * 8.0,
                  controller: passwordController,
                  hintText: 'Enter your password',
                  inputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if(value == null || value.isEmpty) {
                      return "Mandatory Fields";
                    } else if (value.length < 6) {
                      return "Password must be more than 5 digits";
                    }
                  },
                ),
                kSizedBox(),
                CustomPassTextFormField(
                  h: h * 0.06,
                  w: w * 8.0,
                  controller: confirmPasswordController,
                  hintText: 'Confirm your password',
                  inputAction: TextInputAction.done,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if(value == null || value.isEmpty) {
                      return "Mandatory Fields";
                    } else if (value.length < 6) {
                      return "Password must be more than 5 digits";
                    }
                  },
                ),
                SizedBox(
                  height: h * 0.05,
                ),
                ElevatedButton(
                  child: CustomWidgets().text('SignUp', 18),
                  onPressed: () {
                    if(formKey.currentState!.validate()) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                    }
                  },
                ),
                SizedBox(
                  height: h * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: Container(
                        height: h * 0.07,
                        width: w * 0.13,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 1.5),
                            borderRadius: BorderRadius.circular(15)),
                        child: const Center(
                          child: Icon(
                            FontAwesomeIcons.google,
                            size: 30,
                          ),
                        ),
                      ),
                      onTap: () {
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen() ));
                      },
                    ),
                    SizedBox(
                      width: w * 0.1,
                    ),
                    GestureDetector(
                      child: Container(
                        height: h * 0.07,
                        width: w * 0.13,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 1.5),
                            borderRadius: BorderRadius.circular(15)),
                        child: const Center(
                          child: FaIcon(
                            FontAwesomeIcons.facebook,
                            size: 30,
                          ),
                        ),
                      ),
                      onTap: () {
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen() ));
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: h * 0.05,
                ),
                RichText(
                  text: TextSpan(
                      text: "Already have account? ",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                      children: [
                        TextSpan(
                            text: 'Login',
                            style: const TextStyle(
                                fontSize: 18,
                                color: ColorConstants.primaryOrange),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const LoginScreen()));
                              })
                      ]),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
