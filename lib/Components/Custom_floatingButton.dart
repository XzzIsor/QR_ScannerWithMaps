import 'package:flutter/material.dart';

class CustomFloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: Icon(Icons.qr_code_scanner_outlined),
      onPressed: (){},
    );
  }
}
