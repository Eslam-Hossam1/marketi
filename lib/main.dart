import 'package:flutter/material.dart';
import 'package:marketi/app_initializer.dart';
import 'package:marketi/marketi_app.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitializer.initialize();
  runApp(const MarketiApp());
}
