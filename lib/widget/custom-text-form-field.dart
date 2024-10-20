import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo/widget/decorated-input-border.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    Key? key,
    required this.keyboardType,
    required this.labelText,
    this.prefixIcon,
    this.scurePass,
    this.inputFormatter,
    this.suffixIcon,
    this.validate,
    this.onSave,
    this.controller,
    this.focusNode,
    this.onEnter,
    this.numLines = 1,
    this.isEnabled = true,
  }) : super(key: key);

  final TextInputType keyboardType;
  final String labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? scurePass;
  final bool isEnabled;
  final int numLines;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatter;
  final void Function(String)? onEnter;

  final String? Function(String?)? validate;
  final Function(String?)? onSave;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 5,
      ),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        focusNode: focusNode,
        controller: controller,
        enabled: isEnabled,
        maxLines: numLines,
        obscureText: scurePass ?? false,
        keyboardType: keyboardType,
        inputFormatters: inputFormatter,
        cursorColor: Colors.black87,
        decoration: InputDecoration(
          isDense: true,
          /*fillColor: const Color.fromRGBO(255, 255, 255, 1),
          filled: true,*/
          contentPadding: const EdgeInsetsDirectional.symmetric(
              vertical: 15, horizontal: 25),
          border: DecoratedInputBorder(
            child: InputBorder.none,
            shadow: BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset: Offset(0, 10),
              blurRadius: 10,
              spreadRadius: 1
            ),
          ),
          focusedBorder: DecoratedInputBorder(
            child: InputBorder.none,
            shadow: BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                offset: Offset(0, 5),
                blurRadius: 5,
                spreadRadius: 2
            ),
          ),
          hintText: labelText,
          hintStyle: TextStyle(color: Colors.grey.shade400),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
        ),
        onFieldSubmitted: onEnter,
        onSaved: onSave,
        validator: validate,
      ),
    );
  }
}
