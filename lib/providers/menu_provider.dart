import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:card_conekta/models/card_model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:localstorage/localstorage.dart';

class _MenuCardsProvider extends ChangeNotifier {
  int _option;

  set optionSelect(int option) {
    this._option = option;
  }

  get optionSelect {
    return this._option;
  }

  List<dynamic> options = [];

  Future<List<Opcion>> loadOpciones() async {
    final resp = await rootBundle.loadString('data/cards_user.json');

    Map responseDecode = jsonDecode(resp);
    options = responseDecode['cards'];

    final optionsData = new Opciones.fromJsonList(options);

    return optionsData.items;
  }

  Future<String> loadCardToken() async {
    final resp = await rootBundle.loadString('data/cards_user.json');

    Map responseDecode = jsonDecode(resp);
    final tokenCard =
        responseDecode['cards'][_option - 1]["data_card"]["token"];

    return tokenCard;
  }

  Future<dynamic> loadOpcionesPruebas() async {
    final LocalStorage storage = new LocalStorage('cards');

    print(storage);
    /* 
      Map responseDecode = jsonDecode(storage);
      final tokenCard =
          responseDecode['cards'][_option - 1]["data_card"]["token"];

      return tokenCard; */

    return storage;
  }
}

final menuProvider = new _MenuCardsProvider();
