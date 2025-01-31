// ignore_for_file: public_member_api_docs, document_ignores

part of 'text_field.dart';

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
    this.prefixIcon,
    this.contentPadding,
    this.obscureText = false,
    this.maxLength = 30,
  });

  final Iterable<String>? autofillHints;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final bool obscureText;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLength: maxLength,
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
        prefixIcon: prefixIcon,
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
