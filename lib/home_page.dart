// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:plant_shop_app/description_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:plant_shop_app/login_or_register_page.dart';

class Plant {
  final String name;
  final String description;
  final String price;
  final String image;

  Plant(
      {required this.name,
      required this.description,
      required this.price,
      required this.image});
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Plant> plants = [];

  @override
  void initState() {
    super.initState();
    getPlantsData();
  }

  Future<dynamic> _navlog(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginOrRegisterPage()),
    );
  }

  void signUserOut() {
    FirebaseAuth.instance.signOut();
    _navlog(context);
  }

  Future<void> getPlantsData() async {
    final databaseReference = FirebaseFirestore.instance;
    QuerySnapshot plantsSnapshot =
        await databaseReference.collection("Plants").get();
    plants = plantsSnapshot.docs
        .map((documentSnapshot) => Plant(
              name: documentSnapshot.get("Plant Name"),
              description: documentSnapshot.get("Plant Description"),
              price: documentSnapshot.get("Plant Price"),
              image: documentSnapshot.get("Image URL"),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[100],
      appBar: AppBar(
        title: Text('Plant Shop'),
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: FutureBuilder<void>(
        future: getPlantsData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            print(plants.length);
            return ListView.builder(
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
                              image: NetworkImage(plants[index].image),
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
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40),
                            ),
                          ),
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
                              style: TextStyle(
                                  color: Color.fromARGB(255, 2, 42, 5)),
                            ),
                          ),
                          tileColor: Colors.lightGreen[300],
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
            );
          }
        },
      ),
    );
  }
}
