import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qr_scanner/models/scan_model.dart';

class DBProvider {
  FirebaseFirestore db = FirebaseFirestore.instance;
  static final DBProvider _singleton = DBProvider._internal();

  factory DBProvider() {
    return _singleton;
  }

  DBProvider._internal();

  List<ScanModel> _scanModelList = new List<ScanModel>();

  final _firestoreStreamController =
      StreamController<List<ScanModel>>.broadcast();

  Function(List<ScanModel>) get firestoreSink =>
      _firestoreStreamController.sink.add;

  Stream<List<ScanModel>> get firestoreStream =>
      _firestoreStreamController.stream;

  void disposeStream() => _firestoreStreamController?.close();

  Future<void> initializeStream() async {
    List<ScanModel> httpScanModelList = await getHttpDocuments();
    List<ScanModel> geoScanModelList = await getGeoDocuments();
    _scanModelList = [...httpScanModelList, ...geoScanModelList];
    firestoreSink(_scanModelList);
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

  Future<void> deleteDocuments({String id, @required bool http}) async {
    if (id != null) {
      _scanModelList.removeWhere((doc) => doc.id == id); 
      firestoreSink(_scanModelList);
      await db.collection(http ? "http" : "geo").doc(id).delete();
      return;
    }
    firestoreSink([]);
    _scanModelList = [];
    QuerySnapshot query = await db.collection('http').get();
    query.docs.forEach((QueryDocumentSnapshot doc) async {
      ScanModel newModel = new ScanModel(
          value: doc.data()["value"], id: doc.id, type: http ? "http" : "geo");
      await db.collection(http ? "http" : "geo").doc(newModel.id).delete();
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
