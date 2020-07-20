import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/overview_screen.dart';
import './screens/detail_screen.dart';
import './providers/pokedex.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Pokedex(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false, // for disable debug tag on device
        title: 'Pokedex App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: OverviewScreen(),
        initialRoute: '/',
        routes: {
          DetailScreen.routeName: (ctx) => DetailScreen(),
        },
      ),
    );
  }
}
