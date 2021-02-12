import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qr_scanner/pages/directions.dart';
import 'package:qr_scanner/pages/maps.dart';

import 'package:qr_scanner/providers/Scan_Provider.dart';


class BodyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _scanProvider = Provider.of<ScanProvider>(context);
    final selected = _scanProvider.type;

    switch (selected) {
      case "geo":
        return MapsPage();
      case "http":
        return DirectionPage();
      default:
        return MapsPage();
    }
  }
}
