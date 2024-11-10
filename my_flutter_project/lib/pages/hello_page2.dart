import 'package:flutter/material.dart';
import 'package:my_flutter_project/widgets/blue_button.dart';

class HelloPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 2"),
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
    Navigator.pop(context, "Tela 2");
  }
}
