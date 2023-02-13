// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:plant_shop_app/auth_page.dart';
import 'package:plant_shop_app/owner_page.dart';

class ChoosingPage extends StatefulWidget {
  const ChoosingPage({super.key});

  @override
  State<ChoosingPage> createState() => _ChoosingPageState();
}

class _ChoosingPageState extends State<ChoosingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plant Shop'),
      ),
      backgroundColor: Colors.lightGreen[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Choose your role',
              style: TextStyle(
                color: Color.fromARGB(255, 2, 42, 5),
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              height: 50.0,
              width: 120.0,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AuthPage(),
                    ),
                  );
                },
                child: Text('Customer'),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              height: 50.0,
              width: 120.0,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OwnerPage(),
                    ),
                  );
                },
                child: Text('Owner'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
