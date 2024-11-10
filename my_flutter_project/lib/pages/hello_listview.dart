import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_project/pages/dog_page.dart';
import 'package:my_flutter_project/utils/navigation.dart';

class Dog {
  String name;
  String photo;

  Dog(this.name, this.photo);
}

class HelloListView extends StatefulWidget {
  @override
  State<HelloListView> createState() => _HelloListViewState();
}

class _HelloListViewState extends State<HelloListView> {
  bool _gridView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
        actions: [
          IconButton(
              onPressed: () {
                print("GridView!");
                setState(() {
                  _gridView = true;
                });
              },
              icon: Icon(Icons.grid_on)),
          IconButton(
              onPressed: () {
                print("ListView!");
                setState(() {
                  _gridView = false;
                });
              },
              icon: Icon(Icons.list)),
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    List<Dog> dogs = [
      Dog("Lulu", "assets/images/dog1.jpeg"),
      Dog("Lhasa", "assets/images/dog2.jpeg"),
      Dog("Maltes", "assets/images/dog3.jpeg"),
      Dog("Rottweiler", "assets/images/dog4.jpeg"),
      Dog("Beagle", "assets/images/dog5.jpeg"),
    ];

    if (_gridView) {
      return GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: dogs.length,
          itemBuilder: (context, index) {
            return _itemView(dogs, index);
          });
    } else {
      return ListView.builder(
          itemExtent: 450,
          itemCount: dogs.length,
          itemBuilder: (context, index) {
            return _itemView(dogs, index);
          });
    }
  }

  _itemView(List<Dog> dogs, int index) {
    return GestureDetector(
      onTap: (){
        navigate(context, DogPage(dogs[index]));
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          _image(dogs[index].photo),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                dogs[index].name,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _image(source) {
    //return Image.network("https://img.freepik.com/fotos-gratis/paisagem-de-praia-do-havai-com-natureza-e-litoral_23-2151795032.jpg?t=st=1730148164~exp=1730151764~hmac=e445693a80aee5ac6a0dbe20da5689c169efd02db533ae6d04cd833829c63c3a&w=740");
    return Image.asset(
      source,
      fit: BoxFit.cover,
    );
  }
}
