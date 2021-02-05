import 'package:flutter/material.dart';
import 'package:qr_scanner/Components/Body_HomePage.dart';

import 'package:qr_scanner/Components/Custom_floatingButton.dart';
import 'package:qr_scanner/Components/Custom_navigationbar.dart';

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
            onPressed: () {},
          )
        ],
      ),
      body: BodyPage(),
      floatingActionButton: CustomFloatingButton(),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}
