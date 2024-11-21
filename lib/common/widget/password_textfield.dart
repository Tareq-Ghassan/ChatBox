import 'package:chat/common/function/common_functions.dart';
import 'package:chat/common/widget/eye_suficx_icon.dart';
import 'package:chat/common/widget/text_form_field.dart';
import 'package:chat/presentation/controller/authentication_controller.dart';
import 'package:chat/provider/cubit/forms_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [PasswordTextField] represent email textField
class PasswordTextField extends StatelessWidget {
  /// [PasswordTextField] constructor
  const PasswordTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HidePasswordCubit(),
      child: BlocBuilder<HidePasswordCubit, bool>(
        builder: (context, hidePassword) {
          return KTextFormField(
            autofillHints: const [
              AutofillHints.password,
            ],
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            hintText: appLocalizations.password,
             obscureText: hidePassword,
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
            suffixIcon: EyeSufixIcon(
              iconData: hidePassword
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
            ),
            validator: (value) => validateInputPassword(
              context,
              value,
            ),
            onSaved: (value) {
              if (value != null) {
                context.read<PasswordCubit>().setPassword(newVal: value);
              } else {
                context.read<PasswordCubit>().setPassword(newVal: '');
              }
            },
          );
        },
      ),
    );
  }
}
