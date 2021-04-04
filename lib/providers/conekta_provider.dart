import 'package:flutter/material.dart';
import 'package:flutter_conekta/flutter_conekta.dart';

class _TokenConekta extends ChangeNotifier {
  String _token;
  Map _data;
  String _publicKeyConekta = 'key_eYvWV7gSDkNYXsmr';

  set dataCard(Map data) {
    this._data = data;
  }

  set token(String token) {
    this._token = token;
  }

  get tokenCard {
    return this._token;
  }

  Future tokenCardConketa() async {
    final tokenCard = await FlutterConekta.tokenizeCard(
        publicKey: _publicKeyConekta,
        cardholderName: _data['headline'],
        cardNumber: _data['card_number'],
        cvv: _data['cvv'],
        expiryMonth: _data['expiry_month'],
        expiryYear: _data['expiry_year']);

    _token = tokenCard;
  }
}

final tokenConekta = new _TokenConekta();
