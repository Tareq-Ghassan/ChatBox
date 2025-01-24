// ignore_for_file: public_member_api_docs

import 'package:chat/core/presentation/theme/colors.dart';
import 'package:chat/core/util/util.dart';
import 'package:flutter/material.dart';

///[KTextFormField] represent super class for all text form field
class KTextFormField extends StatelessWidget {
  ///[KTextFormField] constructor
  const KTextFormField({
    required this.hintText,
    super.key,
    this.autofillHints,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.onSaved,
    this.suffixIcon,
    this.contentPadding,
    this.obscureText = false,
  });

  final Iterable<String>? autofillHints;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final String hintText;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLength: 30,
      autocorrect: false,
      decoration: InputDecoration(
        counterText: '',
        hintText: hintText,
        hintStyle: isLightMode
            ? Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: KColors.greenColor,
                )
            : null,
        suffixIcon: suffixIcon,
        contentPadding: contentPadding,
      ),
      autofillHints: autofillHints,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      validator: validator,
      onSaved: onSaved,
    );
  }
}
