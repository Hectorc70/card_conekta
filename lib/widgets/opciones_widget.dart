import 'package:flutter/material.dart';

class Opciones extends StatelessWidget {
  final List<dynamic> opciones;

  Opciones({@required this.opciones});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
        children: _card(context),
      ),
    );
  }

  List<Widget> _card(BuildContext context) {
    return opciones.map((opcion) {
      return ListTile(
        title: Text(opcion.descripcion),
      );
    }).toList();
  }
}
