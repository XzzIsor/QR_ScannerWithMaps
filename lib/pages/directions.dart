import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/Components/Custom_ListTile.dart';
import 'package:qr_scanner/providers/Scan_Provider.dart';

class DirectionPage extends StatefulWidget {
  @override
  _DirectionPageState createState() => _DirectionPageState();
}

class _DirectionPageState extends State<DirectionPage> {
  @override
  Widget build(BuildContext context) {
    final _scanProvider = Provider.of<ScanProvider>(context, listen: true);
    return ListView(
      children: _scanProvider.scanModelList.map((doc) {
        if (doc.type == 'http'){
          return CustomListTile(
            loading: doc.id == 'loading', 
            value: doc.value, 
            function:() => _scanProvider.deleteScan(doc.id),);
        }
      }).toList());
  }
}
