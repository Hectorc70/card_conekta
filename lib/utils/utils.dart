import 'package:flutter/material.dart';


void mostrarAlerta(BuildContext context, String titleT, String descripcion) {

  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(titleT),
          content: Text(descripcion),
          actions: <Widget>[
            TextButton(
              child: Text('Ok'),
              onPressed: () => Navigator.of(context).pop(),
            ),

          ],
        );
      });
}