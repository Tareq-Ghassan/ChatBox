import 'package:chat/features/authentication/ui/bloc/forms_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///[EyeSuffixIcon] hold eye suffix icon in text field
class EyeSuffixIcon extends StatelessWidget {
  ///[EyeSuffixIcon] constructor.
  const EyeSuffixIcon({required this.iconData, super.key});

  ///[iconData] property,
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final cubit = context.read<HidePasswordCubit>();
        final hidePasswordState = cubit.state;
        cubit.hidePassword = !hidePasswordState;
      },
      child: Icon(
        iconData,
      ),
    );
  }
}
