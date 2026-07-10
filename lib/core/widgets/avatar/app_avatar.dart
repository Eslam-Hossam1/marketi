import 'package:flutter/material.dart';
import 'package:nextcart/core/utils/assets.dart';
import 'package:nextcart/core/widgets/custom_cached_network_image.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppAvatar extends StatelessWidget {
  final String? imageUrl;
  final double radius;
  final Color? backgroundColor;

  const AppAvatar({
    super.key,
    required this.imageUrl,
    required this.radius,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor:
          backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      child: ClipOval(child: _buildImage()),
    );
  }

  Widget _buildImage() {
    String? url = imageUrl;
    if (url == null || url.trim().isEmpty) {
      return _defaultAvatar();
    }

    Map<String, String>? headers;
    if (url.contains('/storage/v1/object/public/')) {
      url = url.replaceAll(
          '/storage/v1/object/public/', '/storage/v1/object/authenticated/');
      final token = Supabase.instance.client.auth.currentSession?.accessToken;
      if (token != null) {
        headers = {'Authorization': 'Bearer $token'};
      }
    }

    return CustomCachedNetworkImage(
      url: url,
      width: radius * 2,
      height: radius * 2,
      httpHeaders: headers,
    );
  }

  Widget _defaultAvatar() {
    return Image.asset(
      Assets.imagesPngDefaultAvatar,
      width: radius * 2,
      height: radius * 2,
      fit: BoxFit.cover,
    );
  }
}
