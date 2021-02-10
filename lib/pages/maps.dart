import 'package:flutter/material.dart';

import 'package:qr_scanner/models/scan_model.dart';
import 'package:qr_scanner/providers/DB_provider.dart';


class MapsPage extends StatelessWidget {
  final DBProvider db = new DBProvider();

  @override
  Widget build(BuildContext context) {
    final DBProvider db = new DBProvider();
    DBProvider cosa = DBProvider();
    return FutureBuilder<List<ScanModel>>(
        // <2> Pass `Future<QuerySnapshot>` to future
        future: cosa.getAllScanModel(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // <3> Retrieve `List<DocumentSnapshot>` from snapshot
            final List<ScanModel> documents = snapshot.data;
            return ListView(
                children: documents
                    .map((doc) => doc.type == "geo"
                        ? Card(
                            child: ListTile(
                              title: Text(doc.value),
                            ),
                          )
                        : Container())
                    .toList());
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}