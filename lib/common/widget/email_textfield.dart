import 'package:chat/common/function/common_functions.dart';
import 'package:chat/common/widget/k_text_form_field.dart';
import 'package:chat/presentation/controller/authentication_controller.dart';
import 'package:chat/provider/cubit/forms_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      validator: (value) => validateEmail(
        context,
        value,
      ),
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
