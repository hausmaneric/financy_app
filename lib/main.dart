import 'package:financy_app/app.dart';
import 'package:financy_app/firebase_options.dart';
import 'package:financy_app/locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupDependecies();
  runApp(const App());
}
