import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qr_scanner/screens/home_screen.dart';

import 'package:qr_scanner/screens/map_screen.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:qr_scanner/providers/ERROR_provider.dart';
import 'package:qr_scanner/providers/Scan_Provider.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ErrorProvider(_)),
                  ChangeNotifierProvider(create: (_) => ScanProvider.instance)
                ],
      child: MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        title: 'QR_Scanner',
        initialRoute: '/',
        routes: <String, Widget Function(BuildContext)>{
          "/": (_) => HomeScreen(),
          'map': (_) => MapScreen()
        },
      ),
    );
  }
}
