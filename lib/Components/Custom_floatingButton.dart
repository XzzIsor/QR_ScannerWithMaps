import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_scanner/models/scan_model.dart';
import 'package:qr_scanner/providers/DB_provider.dart';

class CustomFloatingButton extends StatelessWidget {
  final DBProvider db =new DBProvider();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: Icon(Icons.qr_code_scanner_outlined),
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#098673', 'Cancelar', false, ScanMode.QR);
        print(barcodeScanRes);
        ScanModel newScanModel = new ScanModel(value: barcodeScanRes);
        db.addData(newScanModel);
      }
    );
    
  }
}
