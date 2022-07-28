import 'package:flutter/material.dart';
import 'package:food_delivery/screens/login.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  dynamic h,w;

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: h * 0.1,),
          Lottie.asset('assets/food-ready.json'),
          SizedBox(height: h * 0.1,),
          GestureDetector(
            child: Container(
              height: h * 0.07,
              width: w * 0.13,
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).primaryColor, width: 1.5),
                borderRadius: BorderRadius.circular(15)
              ),
              child: const Center(
                child: Icon(Icons.arrow_forward_ios, size: 30,),
              ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen() ));
            },
          )
        ],
      ),
    );
  }
}
