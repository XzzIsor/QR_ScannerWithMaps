import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:qr_scanner/Components/Body_HomePage.dart';

import 'package:qr_scanner/Components/Custom_floatingButton.dart';
import 'package:qr_scanner/Components/Custom_navigationbar.dart';

class HomeScreen extends StatelessWidget {
  hola() async {
    await Firebase.initializeApp();
    FirebaseFirestore db = FirebaseFirestore.instance;
    final hola = await db.collection('si').doc('test').get();
    print('afskjasfbakfgafkljasfnalsf');
    print(hola.data());
  }

  @override
  Widget build(BuildContext context) {
    hola();
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
