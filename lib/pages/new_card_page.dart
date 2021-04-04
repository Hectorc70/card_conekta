import 'package:card_conekta/pages/menu_cards_page.dart';
import 'package:card_conekta/providers/conekta_provider.dart';
import 'package:card_conekta/utils/utils.dart';
import 'package:flutter/material.dart';

import 'package:flutter_credit_card/flutter_credit_card.dart';

class NewCardPage extends StatefulWidget {
  NewCardPage({Key key}) : super(key: key);

  @override
  _NewCardPageState createState() => _NewCardPageState();
}

class _NewCardPageState extends State<NewCardPage> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          CreditCardWidget(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            showBackView: isCvvFocused,
            obscureCardNumber: true,
            obscureCardCvv: true,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  CreditCardForm(
                    formKey: formKey,
                    obscureCvv: true,
                    obscureNumber: true,
                    cardNumber: cardNumber,
                    cvvCode: cvvCode,
                    cardHolderName: cardHolderName,
                    expiryDate: expiryDate,
                    themeColor: Colors.blue,
                    cardNumberDecoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Numero de Tarjeta',
                      hintText: 'XXXX XXXX XXXX XXXX',
                    ),
                    expiryDateDecoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Fecha de Vencimiento',
                      hintText: 'XX/XX',
                    ),
                    cvvCodeDecoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'CVV',
                      hintText: 'XXX',
                    ),
                    cardHolderDecoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nombre del Titula',
                    ),
                    onCreditCardModelChange: onCreditCardModelChange,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      primary: const Color(0xff1b447b),
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      child: const Text(
                        'Guardar',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'halter',
                          fontSize: 14,
                          package: 'flutter_credit_card',
                        ),
                      ),
                    ),
                    onPressed: () async {
                      if (formKey.currentState.validate()) {
                        Map data = {
                          "headline": cardHolderName,
                          "card_number": cardNumber,
                          "cvv": cvvCode,
                          "expiry_month": expiryDate.split('/')[0],
                          "expiry_year": expiryDate.split('/')[1],
                        };
                        tokenConekta.dataCard = data;
                        await tokenConekta.tokenCardConketa();

                        if (tokenConekta.tokenCard != null) {
                          mostrarAlerta(context, 'Aviso', 'Tarjeta Guardada correctamente');
                          Navigator.pushNamed(context, '/');
                        }
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _loadNewCard() {
    return FutureBuilder(
        future: tokenConekta.tokenCardConketa(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData && snapshot.data != '') {
            return MenuPage();
          } else {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 200.0),
              child: Center(child: CircularProgressIndicator()),
            );
          }
        });
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
