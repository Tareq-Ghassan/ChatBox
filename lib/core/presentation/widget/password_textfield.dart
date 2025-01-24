import 'package:chat/core/presentation/widget/eye_suffix_icon.dart';
import 'package:chat/core/presentation/widget/k_text_form_field.dart';
import 'package:chat/core/util/locale_utils.dart';
import 'package:chat/dependency_injection/di.dart';
import 'package:chat/features/authentication/ui/bloc/forms_cubit.dart';
import 'package:chat/features/authentication/ui/controls/authentication_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [PasswordTextField] represent email textField
class PasswordTextField extends StatelessWidget {
  /// [PasswordTextField] constructor
  const PasswordTextField({
    this.isConfirmPassword = false,
    super.key,
  });

  ///[isConfirmPassword] holds if this textfield used for password
  ///or confirm password
  final bool isConfirmPassword;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<HidePasswordCubit>(),
      child: BlocBuilder<HidePasswordCubit, bool>(
        builder: (context, hidePassword) {
          return KTextFormField(
            autofillHints: const [
              AutofillHints.password,
            ],
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            hintText: isConfirmPassword
                ? appLocalizations.confirmPassword
                : appLocalizations.password,
            obscureText: hidePassword,
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
            suffixIcon: EyeSuffixIcon(
              iconData: hidePassword
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
            ),
            validator: (value) => isConfirmPassword
                ? validateConfirmPassword(
                    context,
                    value,
                  )
                : validateInputPassword(
                    context,
                    value,
                  ),
            onSaved: (value) {
              if (isConfirmPassword) {
                if (value != null) {
                  context.read<ConfirmPasswordCubit>().confirmPassword = value;
                } else {
                  context.read<ConfirmPasswordCubit>().confirmPassword = '';
                }
              } else {
                if (value != null) {
                  context.read<PasswordCubit>().password = value;
                } else {
                  context.read<PasswordCubit>().password = '';
                }
              }
            },
          );
        },
      ),
    );
  }
}
