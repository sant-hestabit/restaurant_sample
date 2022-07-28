import 'package:flutter/material.dart';

class CustomPassTextFormField extends StatefulWidget {
  final h, w, controller, hintText, validator, inputAction, keyboardType;

  const CustomPassTextFormField(
      {Key? key,
      this.h,
      this.w,
      this.controller,
      this.hintText,
      this.validator,
      this.inputAction,
      this.keyboardType,
      })
      : super(key: key);

  @override
  State<CustomPassTextFormField> createState() =>
      _CustomPassTextFormFieldState();
}

class _CustomPassTextFormFieldState extends State<CustomPassTextFormField> {
  bool hide = true;

  void toggle() {
    setState(() {
      hide = !hide;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.h,
      width: widget.w,
      child: TextFormField(
        obscureText: hide,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        textInputAction: widget.inputAction,
        decoration: InputDecoration(
            hintText: widget.hintText,
            suffixIcon: IconButton(
              icon: hide
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility),
              onPressed: () {
                toggle();
              },
            )),
        validator: widget.validator,
      ),
    );
  }
}
