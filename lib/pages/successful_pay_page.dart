import 'package:card_conekta/utils/utils.dart';
import 'package:flutter/material.dart';

class PayPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            _title(context, "Pago Exitoso"),
          ],),),
    );
  }


  Widget _title(BuildContext context, String texto) {
    final colorPrincipal = Theme.of(context).primaryColor;
    return Row(
      children: [
        Text(
          texto,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 30.0,
            color: Colors.green,
            fontWeight: FontWeight.w800,
          ),
        )
      ],
    );
  }
}