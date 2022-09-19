import 'package:flutter/material.dart';

import '../../../const.dart';

class CustomTextField extends StatefulWidget {

  final TextEditingController? controller;
  final Key? fieldKey;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType? inputType;

  const CustomTextField({
    this.controller,
    this.fieldKey,
    this.hintText,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
    this.inputType
  });


  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  bool _obscureText = true;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: backGroundColor,
        borderRadius: BorderRadius.circular(3),
      ),
      child: TextFormField(
        style: const TextStyle(color: primaryColor),
        controller: widget.controller,
        keyboardType: widget.inputType,
        key: widget.fieldKey,
        onSaved: widget.onSaved,
        validator: widget.validator,
        onFieldSubmitted: widget.onFieldSubmitted,
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
          border: InputBorder.none,
          filled: true,
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: secondaryColor),
        ),
      ),
    );
  }
}