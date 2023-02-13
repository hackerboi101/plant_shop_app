// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:plant_shop_app/choosing_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    Builder(builder: (context) {
      return MaterialApp(
        home: ChoosingPage(),
        theme: ThemeData(primarySwatch: Colors.lightGreen),
        debugShowCheckedModeBanner: false,
      );
    }),
  );
}
