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

  void addScan(String value) async {
    ScanModel newScanModel = ScanModel(value: value);
    db.addData(newScanModel);
    initializeScanList(); //!this already  calls the notifyListener()
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
    type == 'http'
        ? db.deleteDocuments(http: true)
        : db.deleteDocuments(http: false);
  }

  void deleteScan(String id) async {
    type == 'http'
        ? await db.deleteDocuments(http: true, id: id)
        : await db.deleteDocuments(http: false, id: id);
    initializeScanList(); //!this already  calls the notifyListener()
  }
}
