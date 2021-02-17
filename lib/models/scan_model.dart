import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

ScanModel scanModelFromJson(String str) => ScanModel.fromJson(json.decode(str));

String scanModelToJson(ScanModel data) => json.encode(data.toJson());

class ScanModel {
  ScanModel({
    this.id,
    this.type,
    @required this.value,
  }) {
    this.type = value.contains("http")
        ? "http"
        : value.contains("geo")
            ? "geo"
            : "without Type";
  }

  String id;
  String type;
  String value;

  LatLng getLatLng() {
    final latLng = value.substring(4).split(",");
    final lat = double.parse(latLng[0]);
    final lng = double.parse(latLng[1]);
    return LatLng(lat, lng);
  }

  factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        type: json["type"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "value": value,
      };
}
