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

  Future<List<ScanModel>> getAllScanModel() async {
    List<ScanModel> httpScanModelList = await getCollection('http');
    List<ScanModel> geoScanModelList = await getCollection('geo');
    return [...httpScanModelList, ...geoScanModelList];
  }

  Future<List<ScanModel>> getCollection(String collectionName) async {
    QuerySnapshot query = await db.collection(collectionName).get();
    List<ScanModel> data = new List();
    query.docs.forEach((QueryDocumentSnapshot doc) {
      ScanModel newModel =
          new ScanModel(value: doc.data()["value"], id: doc.id, type: collectionName);
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
      await db.collection(http ? "http" : "geo").doc(id).delete();
      return;
    }
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
