import 'package:flutter/material.dart';
import 'package:my_flutter_project/widgets/blue_button.dart';

class HelloPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 3"),
      ),
      body: _body(context),
    );
  }

  _body(context) {
    return Center(
      child: BlueButton(
        "Voltar",
        () => _onClickBack(context),
      ),
    );
  }

  _onClickBack(context) {
    Navigator.pop(context, "Tela 3");
  }
}
