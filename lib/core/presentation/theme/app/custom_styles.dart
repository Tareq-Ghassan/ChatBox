import 'package:flutter/material.dart';

///[iconButtonStyle] used for search icon in home page
final iconButtonStyle = ButtonStyle(
  iconColor: const WidgetStatePropertyAll(
    Colors.white,
  ),
  shape: WidgetStatePropertyAll(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
      side: const BorderSide(color: Colors.white),
    ),
  ),
);
