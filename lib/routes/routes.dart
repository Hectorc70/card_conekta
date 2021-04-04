import 'package:flutter/material.dart';

import 'package:card_conekta/pages/menu_cards_page.dart';


Map<String, WidgetBuilder> getApplicationRoutes(){
  return <String, WidgetBuilder>{
    '/' :(BuildContext context) => MenuPage(),
    /* 'home':(BuildContext context) => HomePage(), */
  }; 

}