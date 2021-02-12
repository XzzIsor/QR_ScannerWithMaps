import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/Components/Body_HomePage.dart';
import 'package:qr_scanner/Components/Custom_floatingButton.dart';
import 'package:qr_scanner/Components/Custom_navigationbar.dart';

import 'package:qr_scanner/providers/Scan_Provider.dart';


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
            },
          )
        ],
      ),
      body:BodyPage(),
      floatingActionButton: CustomFloatingButton(),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }

  void deleteFunction(BuildContext context) {
    final _scanProvider = Provider.of<ScanProvider>(context, listen: false);
    _scanProvider.deleteAllScans();
  }
}
