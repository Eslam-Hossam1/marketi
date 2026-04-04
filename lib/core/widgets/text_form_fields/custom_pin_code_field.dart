import 'package:flutter/material.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/core/utils/responsive_helper.dart';
import '../../theme/app_text_styles.dart';
import '../../theme/theme_colors_extension.dart';
import '../../utils/form_validators.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomPinCodeField extends StatelessWidget {
  const CustomPinCodeField({
    super.key,
    this.onChanged,
    this.onCompleted,
    this.onSaved,
  });

  final void Function(String)? onChanged;
  final void Function(String)? onCompleted;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    final fieldSize = getFieldWidth(context);

    return MaterialPinFormField(
      length: 6,
      keyboardType: TextInputType.number,
      autovalidateMode: AutovalidateMode.disabled,
      validator: FormValidators.pincodeTextFormFieldValidator,
      onSaved: onSaved,
      onChanged: onChanged,
      onCompleted: onCompleted,
      hintCharacter: '—',
      hintStyle: AppTextStyles.bold24(
        context,
      ).copyWith(color: context.outlineColor.withOpacity(0.5)),
      theme: MaterialPinTheme(
        shape: MaterialPinShape.outlined,
        cellSize: Size(fieldSize, fieldSize),
        borderRadius: BorderRadius.circular(16.r(context)),
        focusedBorderColor: Colors.blue,
        borderColor: context.outlineColor, // ← was defaultBorderColor
        filledBorderColor: context.primaryColor, // ← was activeColor
        textStyle: AppTextStyles.textStyleSemiBold34(
          context,
        ).copyWith(color: context.mainTextColor),
      ),
    );
  }

  double getFieldWidth(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return (48 * (width / ResponsiveHelper.mobileDesignWidth)).clamp(18, 100);
  }
}
