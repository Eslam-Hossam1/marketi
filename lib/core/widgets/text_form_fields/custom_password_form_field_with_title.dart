import 'package:flutter_svg/svg.dart';
import 'package:marketi/core/extensions/smart_scale_extension.dart';
import 'package:marketi/core/theme/app_text_styles.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';
import 'package:marketi/core/utils/assets.dart';
import 'package:marketi/core/utils/form_validators.dart';
import 'package:marketi/core/widgets/spacing/height_space.dart';
import 'package:marketi/core/widgets/text_form_fields/obscure_text_form_field.dart';
import 'package:flutter/material.dart';

class CustomPasswordTextFormFieldWithTitle extends StatelessWidget {
  const CustomPasswordTextFormFieldWithTitle({super.key, this.onSaved});
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          'Password',
          style: AppTextStyles.semiBold14(
            context,
          ).copyWith(color: context.mainTextColor),
        ),
        HeightSpace(height: 4),
        ObscureTextFormField(
          hintText: 'Enter your password',
          validator: FormValidators.passwordValidator,
          onSaved: onSaved,
          prefixIcon: SvgPicture.asset(
            Assets.imagesSvgPasswordIcon,
            fit: BoxFit.contain,
            width: 16.w(context),
          ),
        ),
      ],
    );
  }
}
