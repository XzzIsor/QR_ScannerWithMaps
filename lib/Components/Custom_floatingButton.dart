import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_scanner/models/scan_model.dart';
import 'package:qr_scanner/providers/ERROR_provider.dart';
import 'package:qr_scanner/providers/Scan_Provider.dart';
import 'package:qr_scanner/utils/url_util.dart';

class CustomFloatingButton extends StatelessWidget {
  final ScanProvider _scanProvider = ScanProvider.instance;
  @override
  Widget build(BuildContext context) {
    final ErrorProvider _errorProvider = new ErrorProvider(context);
    return FloatingActionButton(
        elevation: 0,
        child: Icon(Icons.qr_code_scanner_outlined),
        onPressed: () async {
          String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
              '#098673', 'Cancelar', false, ScanMode.QR);
          if (barcodeScanRes == '-1') {
            _errorProvider.error =
                "Cancelado, si hubo un error intenta de nuevo.";
            return;
          }
          var contain = _scanProvider.scanModelList
              .where((element) => element.value == barcodeScanRes);
          if (contain.isEmpty) {
            ScanModel tuPutaMadre = await _scanProvider.addScan(barcodeScanRes);
            launchURL(context, tuPutaMadre);
          } else
            _errorProvider.error = "El dato ingresado ya existe.";
        });
  }
}
