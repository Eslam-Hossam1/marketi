import 'package:flutter/material.dart';
import 'package:nextcart/app_initializer.dart';
import 'package:nextcart/nextcart_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitializer.initialize();
  runApp(const NextCartApp());
}
