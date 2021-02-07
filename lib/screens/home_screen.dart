import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/Components/Body_HomePage.dart';

import 'package:qr_scanner/Components/Custom_floatingButton.dart';
import 'package:qr_scanner/Components/Custom_navigationbar.dart';
import 'package:qr_scanner/providers/DB_provider.dart';
import 'package:qr_scanner/providers/UI_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Historial',
          style: TextStyle(color: Colors.tealAccent),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.delete_forever_rounded,
              color: Colors.tealAccent,
            ),
            onPressed: () {
              deleteFunction(context);
              print("ejecutando"); 
            },
          )
        ],
      ),
      body: BodyPage(),
      floatingActionButton: CustomFloatingButton(),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }

  void deleteFunction(BuildContext context) {
    final DBProvider db = new DBProvider();
    final uiProvider = Provider.of<UIProvider>(context, listen: false);
    final selected = uiProvider.pageSelected;

    switch (selected) {
      case 0:
        db.deleteGeoDocuments();
        break;
      case 1:
        db.deleteHttpDocuments();
        break;
      default:
    }
  }
}
