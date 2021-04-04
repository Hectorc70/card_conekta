import 'package:card_conekta/providers/menu_provider.dart';
import 'package:card_conekta/widgets/appbar_custom_widget.dart';
import 'package:card_conekta/widgets/opciones_widget.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [_menu(context)],
        ),
      ),
    );
  }

  Widget _headerTimeLine() {
    return Container(
      child: Row(
        children: [
          Icon(Icons.mic_sharp),
          Icon(Icons.mic_sharp),
          Icon(Icons.mic_sharp)
        ],
      ),
    );
  }

  Widget _menu(BuildContext context) {
    return FutureBuilder(
        future: menuProvider.loadOpciones(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Opciones(opciones: snapshot.data);
          } else {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 200.0),
              child: Center(child: CircularProgressIndicator()),
            );
          }
        });
  }

  Widget _title(BuildContext context, String texto) {
    final colorPrincipal = Theme.of(context).primaryColor;
    return Row(
      children: [
        Text(
          texto,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18.0,
            color: Colors.grey,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
