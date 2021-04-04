import 'dart:convert';

import 'package:card_conekta/models/card_model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class _MenuCardsProvider {
  List<dynamic> opciones = [];

  Future<List<Opcion>> loadOpciones() async {
    final resp = await rootBundle.loadString('data/cards_user.json');

    Map responseDecode = jsonDecode(resp);
    opciones = responseDecode['cards'];

    final opcionesData = new Opciones.fromJsonList(opciones);

    return opcionesData.items;
  }
}

final menuProvider = new _MenuCardsProvider();
