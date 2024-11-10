import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_project/pages/hello_listview.dart';

class DogPage extends StatelessWidget {
  final Dog dog;

  DogPage(this.dog);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dog.name),
      ),
      body: Image.asset(
        dog.photo,
        fit: BoxFit.cover,
      ),
    );
  }
}
