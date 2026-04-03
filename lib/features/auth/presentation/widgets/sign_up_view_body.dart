import 'package:flutter/material.dart';
import 'package:marketi/core/extensions/smart_scale_extension.dart';
import 'package:marketi/core/utils/assets.dart';
import 'package:marketi/core/utils/constants.dart';
import 'package:marketi/core/widgets/app_logo_image.dart';
import 'package:marketi/core/widgets/buttons/custom_text_button.dart';
import 'package:marketi/core/widgets/sliver_sticky_footer.dart';
import 'package:marketi/core/widgets/spacing/height_space.dart';
import 'package:marketi/core/widgets/spacing/sliver_height_space.dart';
import 'package:marketi/core/widgets/text_form_fields/custom_password_form_field_with_title.dart';
import 'package:marketi/core/widgets/text_form_fields/custom_text_form_field_with_title.dart';
import 'package:marketi/features/auth/presentation/widgets/already_have_an_account.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w(context)),
      child: CustomScrollView(
        slivers: [
          SliverHeightSpace(height: 8),
          SliverToBoxAdapter(
            child: Center(child: AppLogoImage(width: 180.w(context))),
          ),
          SliverHeightSpace(height: Constants.authTextFormFieldsGap),
          SliverToBoxAdapter(
            child: CustomTextFormFieldWithTitle(
              title: "Name",
              hint: "Full Name",
              prefixSvgPath: Assets.imagesSvgUserIcon,
            ),
          ),
          SliverHeightSpace(height: Constants.authTextFormFieldsGap),
          SliverToBoxAdapter(
            child: CustomTextFormFieldWithTitle(
              title: "Phone",
              hint: "Enter your phone number",
              prefixSvgPath: Assets.imagesSvgPhoneIcon,
            ),
          ),
          SliverHeightSpace(height: Constants.authTextFormFieldsGap),
          SliverToBoxAdapter(
            child: CustomTextFormFieldWithTitle(
              title: "Email",
              hint: "Enter your email",
              prefixSvgPath: Assets.imagesSvgEmailIcon,
            ),
          ),
          SliverHeightSpace(height: Constants.authTextFormFieldsGap),
          SliverToBoxAdapter(child: CustomPasswordTextFormFieldWithTitle()),
          SliverHeightSpace(height: Constants.authTextFormFieldsGap),
          SliverToBoxAdapter(child: CustomPasswordTextFormFieldWithTitle()),
          SliverHeightSpace(height: 40),
          SliverStickyFooter(
            children: [
              CustomTextButton(
                width: double.infinity,
                text: 'Sign Up',
                onPressed: () {},
              ),
              HeightSpace(height: 8),
              AlreadyHaveAnAccount(),
            ],
          ),
        ],
      ),
    );
  }
}
