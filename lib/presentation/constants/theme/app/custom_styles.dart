import 'package:flutter/material.dart';

///[iconButtonstyle] used for search icon in home page
final iconButtonstyle = ButtonStyle(
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
