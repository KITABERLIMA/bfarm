// To parse this JSON data, do
//
//     final kota = kotaFromJson(jsonString);

import 'dart:convert';

Kota kotaFromJson(String str) => Kota.fromJson(json.decode(str));

String kotaToJson(Kota data) => json.encode(data.toJson());

class Kota {
  String id;
  String idProvinsi;
  String name;

  Kota({
    required this.id,
    required this.idProvinsi,
    required this.name,
  });

  factory Kota.fromJson(Map<String, dynamic> json) => Kota(
        id: json["id"],
        idProvinsi: json["id_provinsi"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_provinsi": idProvinsi,
        "name": name,
      };
  @override
  String toString() => name;
}
