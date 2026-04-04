import 'package:flutter/material.dart';
import 'package:marketi/core/di/service_locator.dart';
import 'package:marketi/marketi_app.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  runApp(const MarketiApp());
}
