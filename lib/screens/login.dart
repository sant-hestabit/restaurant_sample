import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/screens/home.dart';
import 'package:food_delivery/screens/signup.dart';
import 'package:food_delivery/utils/color_constants.dart';
import 'package:food_delivery/utils/custom_widgets.dart';
import 'package:food_delivery/utils/kpass_text_form_field.dart';
import 'package:food_delivery/utils/ktext_form_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  dynamic h, w;

  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                      child: CustomWidgets().titleText('Login'),
                  ),
                  SizedBox(
                    height: h * 0.06,
                  ),
                  CustomTextFormField(
                      h: h * 0.06,
                      w: w * 8.0,
                      controller: emailController,
                      hintText: 'Enter your email',
                      inputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if(value == null || value.isEmpty) {
                          return "Mandatory Fields";
                        } else if(!(value.contains('@'))){
                          return "Invalid Email Id. Must contain @";
                        }
                      }
                  ),
                  SizedBox(
                    height: h * 0.04,
                  ),
                  CustomPassTextFormField(
                    h: h * 0.06,
                    w: w * 8.0,
                    controller: passwordController,
                    hintText: 'Enter your password',
                    inputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if(value == null || value.isEmpty) {
                        return "Mandatory Fields";
                      } else if (value.length < 6) {
                        return "Password must be more than 5 digits";
                      }
                    }
                  ),
                  SizedBox(
                    height: h * 0.05,
                  ),
                  ElevatedButton(
                    child: CustomWidgets().text('Login', 18),
                    onPressed: () {
                      // if (formKey.currentState!.validate()) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
                      // }
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
                              size: 30.0,
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
                              size: 30.0,
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
                        text: "Don't have account? ",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                        children: [
                          TextSpan(
                              text: 'Sign Up',
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: ColorConstants.primaryOrange),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              const SignUpScreen()));
                                })
                        ]),
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
