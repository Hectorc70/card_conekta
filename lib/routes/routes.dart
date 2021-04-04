import 'package:card_conekta/pages/new_card_page.dart';
import 'package:card_conekta/pages/successful_pay_page.dart';
import 'package:flutter/material.dart';

import 'package:card_conekta/pages/menu_cards_page.dart';


Map<String, WidgetBuilder> getApplicationRoutes(){
  return <String, WidgetBuilder>{
    '/' :(BuildContext context) => MenuPage(),
    'new-card':(BuildContext context) => NewCardPage(), 
    'pay':(BuildContext context) => PayPage(), 
  }; 

}