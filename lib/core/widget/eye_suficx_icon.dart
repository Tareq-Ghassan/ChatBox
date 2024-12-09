import 'package:chat/features/authentication/ui/bloc/forms_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///[EyeSufixIcon] hold eye sufix icon in text field
class EyeSufixIcon extends StatelessWidget {
  ///[EyeSufixIcon] constructor.
  const EyeSufixIcon({required this.iconData, super.key});

  ///[iconData] pproperty,
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
