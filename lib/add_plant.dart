// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, unused_import, must_be_immutable, non_constant_identifier_names

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:plant_shop_app/components/my_button.dart';
import 'package:plant_shop_app/components/my_textfield.dart';
import 'package:plant_shop_app/edit_plant.dart';
import 'package:plant_shop_app/owner_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:plant_shop_app/login_page.dart';

class AddPlant extends StatefulWidget {
  const AddPlant({super.key});

  @override
  State<AddPlant> createState() => _AddPlantState();
}

class _AddPlantState extends State<AddPlant> {
  final plantName = TextEditingController();
  final plantDescription = TextEditingController();
  final plantPrice = TextEditingController();

  CollectionReference Plants = FirebaseFirestore.instance.collection('Plants');

  void showMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  Future<void> addPlants() async {
    final storage = FirebaseStorage.instance;
    final imageRef =
        storage.ref().child('plant_images/${DateTime.now().toString()}');
    final uploadTask = imageRef.putFile(File(image!.path));
    final snapshot = await uploadTask.whenComplete(() {});
    final imageUrl = await snapshot.ref.getDownloadURL();

    return Plants.add({
      'Plant Name': plantName.text,
      'Plant Description': plantDescription.text,
      'Plant Price': plantPrice.text,
      'Image URL': imageUrl,
    })
        .then((value) => showMessage("Plant added successfully"))
        .catchError((error) => showMessage("Plant couldn't be added"));
  }

  XFile? image;

  final ImagePicker picker = ImagePicker();

  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[200],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyTextField(
                  controller: plantName,
                  hintText: 'Plant Name',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: plantDescription,
                  hintText: 'Plant Description',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: plantPrice,
                  hintText: 'Plant Price',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                Container(
                  height: 50.0,
                  width: 120.0,
                  child: ElevatedButton(
                    onPressed: () {
                      myAlert();
                    },
                    child: Text('Upload Image'),
                  ),
                ),
                SizedBox(height: 300),
                MyButton(
                  text: "Add Plant",
                  onTap: () {
                    addPlants();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditPlant(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
