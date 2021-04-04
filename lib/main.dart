import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'package:card_conekta/providers/conekta_provider.dart';
import 'package:card_conekta/routes/routes.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => TokenConekta(),
          ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primaryColor: Color.fromRGBO(231, 31, 16, 1)),
          routes: getApplicationRoutes(),
        ));

}
}