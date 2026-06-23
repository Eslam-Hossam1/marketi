import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/core/theme/app_text_styles.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';
import 'package:marketi/features/orders/domain/entities/order_entity.dart';

class OrderCard extends StatelessWidget {
  final OrderEntity order;

  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h(context)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.w(context)),
        gradient: LinearGradient(
          colors: [
            context.primaryColor.withOpacity(0.1),
            context.primaryColor.withOpacity(0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(
          color: context.primaryColor.withOpacity(0.2),
          width: 1.5,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.w(context)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Padding(
            padding: EdgeInsets.all(16.w(context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Order #${order.id.substring(0, 8).toUpperCase()}',
                      style: AppTextStyles.semiBold16(context),
                    ),
                    _buildStatusChip(context, order.status),
                  ],
                ),
                SizedBox(height: 12.h(context)),
                Text(
                  DateFormat('MMM dd, yyyy - hh:mm a').format(order.orderDate),
                  style: AppTextStyles.regular12(context).copyWith(
                    color: Colors.grey,
                  ),
                ),
                Divider(height: 24.h(context), color: context.primaryColor.withOpacity(0.1)),
                Row(
                  children: [
                    _buildProductThumbnails(context),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Total Price',
                          style: AppTextStyles.regular12(context).copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          '${order.totalPrice.toStringAsFixed(2)} EGP',
                          style: AppTextStyles.semiBold18(context).copyWith(
                            color: context.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatusChip(BuildContext context, String status) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w(context), vertical: 4.h(context)),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.green.withOpacity(0.5)),
      ),
      child: Text(
        status,
        style: AppTextStyles.medium12(context).copyWith(color: Colors.green),
      ),
    );
  }

  Widget _buildProductThumbnails(BuildContext context) {
    return SizedBox(
      height: 40.h(context),
      child: Stack(
        children: List.generate(
          order.products.length > 3 ? 3 : order.products.length,
          (index) => Positioned(
            left: index * 25.w(context),
            child: Container(
              width: 40.w(context),
              height: 40.h(context),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
                image: DecorationImage(
                  image: NetworkImage(order.products[index].thumbnail),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
            ),
          ),
        )..addAll([
          if (order.products.length > 3)
            Positioned(
              left: 3 * 25.w(context),
              child: CircleAvatar(
                radius: 20.w(context),
                backgroundColor: Colors.grey[200],
                child: Text(
                  '+${order.products.length - 3}',
                  style: AppTextStyles.semiBold10(context),
                ),
              ),
            ),
        ]),
      ),
    );
  }
}
