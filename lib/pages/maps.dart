import 'package:flutter/material.dart';
import 'package:qr_scanner/providers/DB_provider.dart';
import 'package:qr_scanner/providers/Scan_Provider.dart';


class MapsPage extends StatelessWidget {
  final DBProvider db = new DBProvider();

  @override
  Widget build(BuildContext context) {
    final ScanProvider _scanProvider = ScanProvider.instance;
    return ListView(
                children: _scanProvider.scanModelList
                    .map((doc) => doc.type == "geo"
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
                        : Container()
                      ).toList());
      }
  }
