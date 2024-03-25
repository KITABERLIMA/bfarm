// To parse this JSON data, do
//
//     final province = provinceFromJson(jsonString);

import 'dart:convert';

Provinsi provinceFromJson(String str) => Provinsi.fromJson(json.decode(str));

String provinceToJson(Provinsi data) => json.encode(data.toJson());

class Provinsi {
  String id;
  String name;

  Provinsi({
    required this.id,
    required this.name,
  });

  factory Provinsi.fromJson(Map<String, dynamic> json) => Provinsi(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
  @override
  String toString() => name;
}
