// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:plant_shop_app/description_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class Plant {
  final String name;
  final String description;
  final double price;
  final String image;

  Plant(
      {required this.name,
      required this.description,
      required this.price,
      required this.image});
}

class HomePage extends StatelessWidget {
  final List<Plant> plants = [
    Plant(
      name: 'Plant 1',
      description: 'Description of plant 1',
      price: 10.0,
      image: 'assets/plant1.jpg',
    ),
    Plant(
      name: 'Plant 2',
      description: 'Description of plant 2',
      price: 20.0,
      image: 'assets/plant2.jpg',
    ),
    Plant(
      name: 'Plant 3',
      description: 'Description of plant 3',
      price: 30.0,
      image: 'assets/plant3.jpg',
    ),
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plant Shop'),
      ),
      body: ListView.builder(
        itemCount: plants.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                leading: Image.asset(
                  plants[index].image,
                  fit: BoxFit.contain,
                ),
                title: Text(plants[index].name),
                subtitle: Text(plants[index].description),
                tileColor: Colors.green[300],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DescriptionPage(
                        plant: plants[index],
                      ),
                    ),
                  );
                },
                horizontalTitleGap: 10,
                minVerticalPadding: 30,
              ),
            ),
          );
        },
      ),
    );
  }
}
