import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
        children: _scanProvider.scanModelList
            .map((doc) => doc.type == "http"
                ? Card(
                    child: ListTile(
                      title: Text(doc.value),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          _scanProvider.deleteScan(doc.id);
                        },
                      ),
                    ),
                  )
                : Container())
            .toList());
  }
}
