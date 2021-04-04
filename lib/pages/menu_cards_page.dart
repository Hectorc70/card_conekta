import 'dart:ffi';

import 'package:card_conekta/providers/conekta_provider.dart';
import 'package:card_conekta/providers/menu_provider.dart';
import 'package:card_conekta/widgets/opciones_widget.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsetsDirectional.fromSTEB(30.0, 10.0, 30.0, 10.0),
        child: Column(
          children: [_title(context, 'Pago'), _menu(context), _button(context)],
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

  Widget _button(BuildContext context) {
    final colorB = Theme.of(context).primaryColor;

    return Material(
        color: colorB,
        elevation: 5.0,
        borderRadius: BorderRadius.circular(20.0),
        shadowColor: Color.fromARGB(250, 1, 24, 76),
        child: MaterialButton(
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
            minWidth: 150.0,
            onPressed: () async {
              if (menuProvider.optionSelect == 4) {
                _pagarConekta(context);
              }
            },
            child: Text(
              "Pagar",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                  decoration: TextDecoration.none,
                  color: Colors.white),
            )));
  }

  void _pagarConekta(BuildContext context) async {

    if (tokenConekta.tokenCard != null) {
      Navigator.pushNamed(context, 'pay');
      
    } else {
      Navigator.pushNamed(context, 'new-card');
    }
  }
}
