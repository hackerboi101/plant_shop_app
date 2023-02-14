// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:plant_shop_app/add_plant.dart';
import 'package:plant_shop_app/edit_plant.dart';

class OwnerPage extends StatefulWidget {
  const OwnerPage({super.key});

  @override
  State<OwnerPage> createState() => _OwnerPageState();
}

class _OwnerPageState extends State<OwnerPage> {
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
              'Choose your task',
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
                      builder: (context) => AddPlant(),
                    ),
                  );
                },
                child: Text('Add Plant'),
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
                      builder: (context) => EditPlant(),
                    ),
                  );
                },
                child: Text('Update Plant'),
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
                      builder: (context) => EditPlant(),
                    ),
                  );
                },
                child: Text('Remove Plant'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
