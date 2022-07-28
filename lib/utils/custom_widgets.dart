import 'package:flutter/material.dart';
import 'package:food_delivery/utils/color_constants.dart';

class CustomWidgets{

  Widget titleText(title) {
    return Text(title, style: const TextStyle(fontSize: 20, color: ColorConstants.primaryOrange),);
  }

  Widget colorText(title,double size, color) {
    return Text(title, style: TextStyle(fontSize: size, color: color),);
  }

  Widget text(title, double size) {
    return Text(title, style: TextStyle(fontSize: size),);
  }

}