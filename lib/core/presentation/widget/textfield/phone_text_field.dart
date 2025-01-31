part of 'text_field.dart';

///[PhoneNumberTextField] represent phone number text field
class PhoneNumberTextField extends StatelessWidget {
  ///[PhoneNumberTextField] constructor
  const PhoneNumberTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return KTextFormField(
      autofillHints: const [
        AutofillHints.telephoneNumberDevice,
      ],
      keyboardType: TextInputType.phone,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      hintText: appLocalizations.phoneNumber,
      prefixIcon: SizedBox(
        width: MediaQuery.of(context).size.width * 0.25,
        child: const DropMenu(),
      ),
      maxLength: 15,
      onSaved: (value) {
        if (value != null) {
          context.read<PhoneNumberCubit>().phone = value;
        } else {
          context.read<PhoneNumberCubit>().phone = '';
        }
      },
      textInputAction: TextInputAction.next,
      validator: InputValidator.validatePhoneNumber,
    );
  }
}
