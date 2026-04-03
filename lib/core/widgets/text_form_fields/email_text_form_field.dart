import 'package:marketi/core/utils/form_validators.dart';
import 'package:marketi/core/widgets/text_form_fields/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class EmailTextFormField extends StatelessWidget {
  const EmailTextFormField({super.key, this.onSaved});

  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: 'Enter your email',
      validator: FormValidators.emailValidator,
      onSaved: onSaved,
    );
  }
}
