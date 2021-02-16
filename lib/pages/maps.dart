import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qr_scanner/providers/DB_provider.dart';
import 'package:qr_scanner/Components/Custom_ListTile.dart';
import 'package:qr_scanner/models/scan_model.dart';
import 'package:qr_scanner/providers/Scan_Provider.dart';
import 'package:qr_scanner/utils/url_util.dart';

class MapsPage extends StatelessWidget {
  final DBProvider db = new DBProvider();

  @override
  Widget build(BuildContext context) {
    return ListView(children: listTilewidgets(context));
  }

  List<Widget> listTilewidgets(BuildContext context) {
    final _scanProvider = Provider.of<ScanProvider>(context, listen: true);

    List<Widget> listTile = [];

    for (int i = 0; i < _scanProvider.scanModelList.length; i++) {
       ScanModel doc = _scanProvider.scanModelList[i];

      if (doc.type == 'geo') {
        listTile.add(CustomListTile(
          loading: doc.id == 'loading',
          value: doc.value,
          cleanFunction: () => _scanProvider.deleteScan(i),
          onTap: () => launchURL(context, doc),
        ));
      }
    }

    return listTile;
  }
}
