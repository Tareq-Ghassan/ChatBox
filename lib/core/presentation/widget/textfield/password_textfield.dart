part of 'text_field.dart';

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
            validator: (value) {
              if (isConfirmPassword) {
                return InputValidator.validateConfirmPassword(
                  password: context.read<PasswordCubit>().state,
                  confirmPassword: value,
                );
              } else {
                final result = InputValidator.validateInputPassword(
                  value,
                );
                context.read<PasswordCubit>().password = value ?? '';
                return result;
              }
            },
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
