part of 'text_field.dart';

///[PhoneNumberTextField] represent phone number text field
class PhoneNumberTextField extends StatelessWidget {
  ///[PhoneNumberTextField] constructor
  const PhoneNumberTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      autofillHints: const [
        AutofillHints.telephoneNumberDevice,
      ],
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        counterText: '',
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        filled: true,
        fillColor: Colors.transparent,
        hintText: appLocalizations.phoneNumber,
        prefixIcon: const Padding(
          padding: EdgeInsets.only(left: 16),
          child: DropMenu(),
        ),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLength: 15,
      onSaved: (value) {
        if (value != null) {
          context.read<PhoneNumberCubit>().phone = value;
        } else {
          context.read<PhoneNumberCubit>().phone = '';
        }
      },
      textInputAction: TextInputAction.next,
      validator: (value) => InputValidator.validatePhoneNumber(
        context,
        value,
      ),
    );
  }
}
