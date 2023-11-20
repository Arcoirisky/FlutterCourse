import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

ScanModel scanModelFromJson(String str) => ScanModel.fromJson(json.decode(str));
String scanModelToJson(ScanModel data) => json.encode(data.toJson());

class ScanModel {
  int? id;
  String valor;
  String? tipo;

  ScanModel({
    this.id,
    required this.valor,
    this.tipo,
  }) {
    if (valor.contains('http')) {
      tipo = 'http';
    } else {
      tipo = 'geo';
    }
  }

  factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        valor: json["valor"],
        tipo: json["tipo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "valor": valor,
        "tipo": tipo,
      };

  LatLng getLatLng() {
    final latLng = valor.substring(4).split(',');
    final lat = double.parse(latLng[0]);
    final lng = double.parse(latLng[1]);
    return LatLng(lat, lng);
  }
}
