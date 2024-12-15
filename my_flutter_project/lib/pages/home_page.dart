import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_flutter_project/pages/hello_listview.dart';
import 'package:my_flutter_project/pages/hello_page2.dart';
import 'package:my_flutter_project/pages/hello_page3.dart';
import 'package:my_flutter_project/utils/navigation.dart';
import 'package:my_flutter_project/widgets/blue_button.dart';
import 'package:my_flutter_project/widgets/drawer_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Hello Flutter!",
          ),
          bottom: TabBar(tabs: [
            Tab(
              text: "TAB 1",
            ),
            Tab(
              text: "TAB 2",
            ),
            Tab(
              text: "TAB 3",
            ),
          ]),
          centerTitle: true,
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: TabBarView(
          children: [
            _body(context),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.yellow,
            ),
          ],
        ),
        floatingActionButton: _buildFloatingActionButton(),
        drawer: DrawerList(),
      ),
    );
  }

  FloatingActionButton _buildFloatingActionButton() {
    return FloatingActionButton(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      elevation: 6.0,
      onPressed: () => _onClickFab(),
      child: Icon(
        Icons.add,
      ),
    );
  }

  _body(context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _text(),
          _pageView(),
          _buttons(context),
        ],
      ),
    );
  }

  _pageView() {
    return Container(
      height: 350,
      child: PageView(
        children: [
          _image("assets/images/dog1.jpeg"),
          _image("assets/images/dog2.jpeg"),
          _image("assets/images/dog3.jpeg"),
          _image("assets/images/dog4.jpeg"),
          _image("assets/images/dog5.jpeg"),
        ],
      ),
    );
  }

  _buttons(context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BlueButton(
              "ListView", () => _onClickNavigator(context, HelloListView())),
          BlueButton("Page 2", () => _onClickNavigator(context, HelloPage2())),
          BlueButton("Page 3", () => _onClickNavigator(context, HelloPage3())),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BlueButton("Snack", () => _onClickSnack(context)),
          BlueButton("Dialog", () => _onClickDialog(context)),
          BlueButton("Toast", _onClickToast),
        ],
      ),
    ]);
  }

  _onClickNavigator(context, Widget page) async {
    String s = await navigate(context, page);

    print(">> $s");
  }

  _onClickToast() {
    Fluttertoast.showToast(
        msg: "Este é um Toast!",
        toastLength: Toast.LENGTH_SHORT,
        // Duração: Toast.LENGTH_SHORT ou Toast.LENGTH_LONG
        gravity: ToastGravity.BOTTOM,
        // Localização do Toast na tela
        timeInSecForIosWeb: 1,
        // Tempo de exibição no iOS/Web
        backgroundColor: Colors.black,
        // Cor de fundo
        textColor: Colors.white,
        // Cor do texto
        fontSize: 16.0 // Tamanho da fonte
        );
  }

  _onClickDialog(context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return PopScope(
            onPopInvokedWithResult: (didPop, result) async {
              return;
            },
            child: AlertDialog(
              title: Text("Flutter is very nice!"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel")),
                TextButton(onPressed: () {}, child: Text("OK")),
              ],
            ),
          );
        });
    print("Clicou no Dialog!");
  }

  _onClickSnack(context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Hello Flutter!"),
      action: SnackBarAction(
          label: "OK",
          onPressed: () {
            print("OK");
          }),
    ));
  }

  _image(source) {
    //return Image.network("https://img.freepik.com/fotos-gratis/paisagem-de-praia-do-havai-com-natureza-e-litoral_23-2151795032.jpg?t=st=1730148164~exp=1730151764~hmac=e445693a80aee5ac6a0dbe20da5689c169efd02db533ae6d04cd833829c63c3a&w=740");
    return Image.asset(source);
  }

  _text() {
    return Text(
      "Hello World!!!",
      style: TextStyle(
          fontSize: 30, color: Colors.blue, fontWeight: FontWeight.bold),
    );
  }

  _onClickFab() {}
}
