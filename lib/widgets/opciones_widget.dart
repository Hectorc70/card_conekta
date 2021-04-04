import 'package:card_conekta/providers/menu_provider.dart';
import 'package:flutter/material.dart';

class Opciones extends StatefulWidget {
  final List<dynamic> opciones;

  Opciones({@required this.opciones});

  @override
  _OpcionesState createState() => _OpcionesState();
}

class _OpcionesState extends State<Opciones> {
  int _value = 1;
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
    return widget.opciones.map((opcion) {
      return ListTile(
        title: Text(opcion.descripcion),
        leading: Radio(
            value: opcion.id,
            groupValue: _value,
            activeColor: Colors.green,
            onChanged: (T) {
              setState(() {
                _value = T;
                menuProvider.optionSelect = T;
              });
            }),
      );
    }).toList();
  }
}
