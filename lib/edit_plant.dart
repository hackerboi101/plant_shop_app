import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class EditPlant extends StatefulWidget {
  EditPlant({super.key});
  final storage = FirebaseStorage.instance;

  @override
  State<EditPlant> createState() => _EditPlantState();
}

class _EditPlantState extends State<EditPlant> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
