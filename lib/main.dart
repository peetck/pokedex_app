import 'package:flutter/material.dart';

import './screens/overview_screen.dart';
import './screens/detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // for disable debug tag on device
      title: 'Pokedex App',
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
        ),
        fontFamily: 'Kanit',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: OverviewScreen(),
      initialRoute: '/',
      routes: {
        DetailScreen.routeName: (ctx) => DetailScreen(),
      },
    );
  }
}
