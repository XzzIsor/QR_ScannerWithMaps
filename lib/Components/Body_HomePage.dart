import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/pages/directions.dart';
import 'package:qr_scanner/pages/maps.dart';
import 'package:qr_scanner/providers/UI_provider.dart';

class BodyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UIProvider>(context);
    final selected = uiProvider.pageSelected;

    switch (selected) {
      case 0:
        return MapsPage();
      case 1:
        return DirectionPage();
      default:
        return MapsPage();
    }
  }
}
