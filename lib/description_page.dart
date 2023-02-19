// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:plant_shop_app/home_page.dart';

class DescriptionPage extends StatelessWidget {
  final Plant plant;

  DescriptionPage({required this.plant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[100],
      appBar: AppBar(
        title: Text(plant.name),
      ),
      body: Column(
        children: [
          Container(
            height: 500.0,
            width: 500.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(plant.image),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  plant.name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[900],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  plant.description,
                  style: TextStyle(color: Colors.green[900]),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Price: ${plant.price} Taka',
                  style: TextStyle(color: Colors.green[900]),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
