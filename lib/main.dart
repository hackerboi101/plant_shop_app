// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:plant_shop_app/description_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.lightGreen),
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
    Plant(
      name: 'Plant 4',
      description: 'Description of plant 4',
      price: 40.0,
      image: 'assets/plant4.jpg',
    ),
    Plant(
      name: 'Plant 5',
      description: 'Description of plant 5',
      price: 50.0,
      image: 'assets/plant5.jpg',
    ),
    Plant(
      name: 'Plant 6',
      description: 'Description of plant 6',
      price: 60.0,
      image: 'assets/plant6.jpg',
    ),
    Plant(
      name: 'Plant 7',
      description: 'Description of plant 7',
      price: 20.0,
      image: 'assets/plant7.jpg',
    ),
    Plant(
      name: 'Plant 8',
      description: 'Description of plant 8',
      price: 30.0,
      image: 'assets/plant8.jpg',
    ),
    Plant(
      name: 'Plant 9',
      description: 'Description of plant 9',
      price: 20.0,
      image: 'assets/plant9.jpg',
    ),
    Plant(
      name: 'Plant 10',
      description: 'Description of plant 10',
      price: 40.0,
      image: 'assets/plant10.jpg',
    ),
    Plant(
      name: 'Plant 11',
      description: 'Description of plant 11',
      price: 50.0,
      image: 'assets/plant11.jpg',
    ),
    Plant(
      name: 'Plant 12',
      description: 'Description of plant 12',
      price: 10.0,
      image: 'assets/plant12.jpg',
    ),
    Plant(
      name: 'Plant 13',
      description: 'Description of plant 13',
      price: 60.0,
      image: 'assets/plant13.jpg',
    ),
    Plant(
      name: 'Plant 14',
      description: 'Description of plant 14',
      price: 20.0,
      image: 'assets/plant14.jpg',
    ),
    Plant(
      name: 'Plant 15',
      description: 'Description of plant 15',
      price: 50.0,
      image: 'assets/plant15.jpg',
    ),
    Plant(
      name: 'Plant 16',
      description: 'Description of plant 16',
      price: 30.0,
      image: 'assets/plant16.jpg',
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
                  borderRadius: BorderRadius.circular(40)),
              color: Colors.lightGreen[200],
              child: Column(
                children: [
                  Container(
                    height: 500.0,
                    width: 500.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(plants[index].image),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                  ),
                  ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    title: Center(
                      child: Text(
                        plants[index].name,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 2, 42, 5)),
                      ),
                    ),
                    subtitle: Center(
                      child: Text(
                        plants[index].description,
                        style: TextStyle(color: Color.fromARGB(255, 2, 42, 5)),
                      ),
                    ),
                    tileColor: Colors.lightGreen[200],
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
