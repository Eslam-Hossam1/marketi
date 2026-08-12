import 'package:flutter/material.dart';
import 'package:nextcart/core/theme/app_text_styles.dart';
import 'package:nextcart/core/theme/theme_colors_extension.dart';
import '../widgets/orders_view_body.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: context.scaffoldBackgroundColor,
        elevation: 0,
        title: Text(
          'My Orders',
          style: AppTextStyles.bold18(context)
              .copyWith(color: context.mainTextColor),
        ),
        centerTitle: true,
      ),
      body: const SafeArea(
        child: OrdersViewBody(),
      ),
    );
  }
}
