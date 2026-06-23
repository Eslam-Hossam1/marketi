import 'package:flutter/material.dart';
import 'package:nexcart/app_initializer.dart';
import 'package:nexcart/nexcart_app.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitializer.initialize();
  runApp(const NexcartApp());
}
