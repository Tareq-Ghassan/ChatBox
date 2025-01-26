part of 'text_field.dart';

/// [EmailTextField] represent email textField
class EmailTextField extends StatelessWidget {
  /// [EmailTextField] constructor
  const EmailTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return KTextFormField(
      autofillHints: const [
        AutofillHints.email,
      ],
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      hintText: appLocalizations.email,
      validator: InputValidator.validateEmail,
      onSaved: (value) {
        if (value != null) {
          context.read<EmailCubit>().email = value;
        } else {
          context.read<EmailCubit>().email = '';
        }
      },
    );
  }
}
