import 'package:flutter/cupertino.dart';
import 'package:qr_scanner/models/scan_model.dart';
import 'package:qr_scanner/providers/DB_provider.dart';

class ScanProvider extends ChangeNotifier {
  List<ScanModel> _scanModelList = new List<ScanModel>();
  DBProvider db = new DBProvider();
  String type = 'http';

  void addScan(String value) async {
    ScanModel newScanModel = ScanModel(value: value);
    _scanModelList.add(newScanModel);
    notifyListeners();
    db.addData(newScanModel);
  }

  void changeType(String type){
    this.type = type;
  }

  void initializeScanList() async {
    _scanModelList = await db.getAllScanModel();
  }

  void deleteAllScans() {
    type == 'http'
        ? db.deleteDocuments(http: true)
        : db.deleteDocuments(http: false);
  }

  void deleteScan(String id) {
    type == 'http'
        ? db.deleteDocuments(http: true, id: id)
        : db.deleteDocuments(http: false, id: id);
  }
}
