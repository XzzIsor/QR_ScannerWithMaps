import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/Components/Custom_ListTile.dart';
import 'package:qr_scanner/models/scan_model.dart';
import 'package:qr_scanner/providers/Scan_Provider.dart';

class DirectionPage extends StatefulWidget {
  @override
  _DirectionPageState createState() => _DirectionPageState();
}

class _DirectionPageState extends State<DirectionPage> {
  List<Widget> listTile;
  final key = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    initializeListTilewidgets(context);
    return ListView.builder(
      itemCount: listTile.length,
      itemBuilder: (context, index) {
        return listTile[index]; 
      },
    );
  }

  void initializeListTilewidgets(BuildContext context) {
    final _scanProvider = Provider.of<ScanProvider>(context, listen: true);
    listTile = [];

    for (int i = 0; i < _scanProvider.scanModelList.length; i++) {
      ScanModel doc = _scanProvider.scanModelList[i];
      if (doc.type == 'http') {
        listTile.add(CustomListTile(
          loading: doc.id == 'loading',
          value: doc.value,
          function: () => _scanProvider.deleteScan(i),
        ));
      }
    }
  }
}
