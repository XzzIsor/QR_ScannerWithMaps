import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qr_scanner/models/scan_model.dart';

class DBProvider {
  static FirebaseFirestore db;

  DBProvider(){
    if (db == null) {
      db = FirebaseFirestore.instance;
    }
  }

  Future<List<ScanModel>> getHttpDocuments() async {
    QuerySnapshot query = await db.collection('http').get();
    List<ScanModel> data = new List();
    query.docs.forEach((QueryDocumentSnapshot doc) {
      ScanModel newModel =
          new ScanModel(value: doc.data()["value"], id: doc.id, type: "http");
      data.add(newModel);
    });
    return data;
  }

  Future<List<ScanModel>> getGeoDocuments() async {
    QuerySnapshot query = await db.collection('geo').get();
    List<ScanModel> data = new List();
    query.docs.forEach((QueryDocumentSnapshot doc) {
      ScanModel newModel =
          new ScanModel(value: doc.data()["value"], id: doc.id, type: "geo");
      data.add(newModel);
    });
    return data;
  }

  Future<void> updateHttpDocument(String id, String value) async {
    return await db.collection("http").doc(id).update({'value': value});
  }

  Future<void> updateGeoDocument(String id, String value) async {
    return await db.collection("geo").doc(id).update({'value': value});
  }

  Future<void> deleteHttpDocuments({String id}) async {
    if (id != null) {
      await db.collection("geo").doc(id).delete();
      return;
    }

    QuerySnapshot query = await db.collection('http').get();
    query.docs.forEach((QueryDocumentSnapshot doc) async{
      ScanModel newModel =
          new ScanModel(value: doc.data()["value"], id: doc.id, type: "http");
      await db.collection("http").doc(newModel.id).delete();
    });
  }

  Future<void> deleteGeoDocuments({String id}) async {
    if (id != null) {
      await db.collection("geo").doc(id).delete();
      return;
    }

    QuerySnapshot query = await db.collection('geo').get();
    query.docs.forEach((QueryDocumentSnapshot doc) async{
      ScanModel newModel =
          new ScanModel(value: doc.data()["value"], id: doc.id, type: "geo");
      await db.collection("geo").doc(newModel.id).delete();
    });
  }

  void addData(ScanModel scanModel) {
    if (scanModel.type == "http") {
      db.collection('http').add({"value": scanModel.value});
    } else {
      db.collection("geo").add({"value": scanModel.value});
    }
  }
}
