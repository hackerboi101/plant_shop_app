// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:plant_shop_app/auth_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    Builder(builder: (context) {
      return MaterialApp(
        home: AuthPage(),
        theme: ThemeData(primarySwatch: Colors.lightGreen),
        debugShowCheckedModeBanner: false,
      );
    }),
  );
}
