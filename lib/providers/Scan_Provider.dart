import 'package:flutter/cupertino.dart';

import 'package:qr_scanner/models/scan_model.dart';

import 'package:qr_scanner/providers/DB_provider.dart';

class ScanProvider extends ChangeNotifier {
  List<ScanModel> scanModelList = new List<ScanModel>();
  DBProvider db = new DBProvider();
  String type = 'http';

  ScanProvider._privateConstructor() {
    initializeScanList();
  }

  static final ScanProvider _instance = ScanProvider._privateConstructor();

  static ScanProvider get instance {
    return _instance;
  }

  Future<ScanModel> addScan(String value) async {
    ScanModel loadScanModel = ScanModel(value: value, id: "loading");
    scanModelList.insert(0, loadScanModel);
    notifyListeners();
    String id = await db.addData(loadScanModel);
    ScanModel newScanModel = ScanModel(value: value, id: id);
    scanModelList.removeAt(0);
    scanModelList.insert(0, newScanModel);
    notifyListeners();
    return newScanModel;
  }

  void changeType(String type) {
    this.type = type;
    notifyListeners();
  }

  void initializeScanList() async {
    scanModelList = await db.getAllScanModel();
    notifyListeners();
  }

  void deleteAllScans() {
    scanModelList = [];
    notifyListeners();
    db.deleteDocuments(collection: type);
  }

  void deleteScan(int index) async {
    ScanModel scandeleted = scanModelList.removeAt(index);
    notifyListeners();
    await db.deleteDocuments(collection: type, id: scandeleted.id);
  }
}
