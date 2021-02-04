import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/screens/home_screen.dart';

import 'package:qr_scanner/providers/UI_provider.dart';

import 'package:qr_scanner/screens/map_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UIProvider())
      ],
      child: MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        title: 'QR_Scanner',
        initialRoute: '/',
        routes: <String, Widget Function(BuildContext)>{
          "/": (_) => HomeScreen(),
          'map' : (_) => MapScreen()
        },
      ),
    );
  }
}
