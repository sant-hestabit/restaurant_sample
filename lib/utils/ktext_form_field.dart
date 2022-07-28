import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final h, w, controller, hintText, validator, inputAction, keyboardType, prefixIcon;

  const CustomTextFormField(
      {Key? key,
      this.h,
      this.w,
      this.controller,
      this.hintText,
      this.validator,
      this.inputAction,
      this.keyboardType,
        this.prefixIcon
      })
      : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.h,
      width: widget.w,
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        textInputAction: widget.inputAction,
        decoration: InputDecoration(
            hintText: widget.hintText,
          prefixIcon: widget.prefixIcon,
        ),
        validator: widget.validator,
      ),
    );
  }
}
