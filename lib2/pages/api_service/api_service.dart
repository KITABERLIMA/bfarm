import 'dart:convert';
import 'package:bfarm_mobileapp/model/provinsi.dart';
import 'package:bfarm_mobileapp/model/kota.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Dropdwn extends StatefulWidget {
  const Dropdwn({Key? key}) : super(key: key);

  @override
  _DropdwnState createState() => _DropdwnState();
}

class _DropdwnState extends State<Dropdwn> {
  String idProvinsi = "0";

  final String apiKey =
      "2ed019ca673ef08cc29666f0af5faa5cc30d16ddb4882770297948bed8e54452";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          DropdownSearch<Provinsi>(
            mode: Mode.BOTTOM_SHEET,
            showSearchBox: true,
            onChanged: (value) {
              setState(() {
                idProvinsi = value?.id ?? "0";
              });
            },
            dropdownBuilder: (context, Provinsi? selectedItem) =>
                Text(selectedItem?.name ?? "Belum memilih Provinsi"),
            popupItemBuilder: (context, Provinsi item, isSelected) => ListTile(
              title: Text(item.name),
            ),
            onFind: (text) async {
              var response = await http.get(Uri.parse(
                  "https://api.binderbyte.com/wilayah/provinsi?api_key=$apiKey"));
              if (response.statusCode != 200) {
                return [];
              }
              List<dynamic> allProvince = json.decode(response.body)["value"];
              List<Provinsi> allModelProvince = [];

              allProvince.forEach((element) {
                allModelProvince.add(Provinsi.fromJson(element));
              });
              return allModelProvince;
            },
          ),
          SizedBox(height: 20),
          if (idProvinsi != "0")
            DropdownSearch<Kota>(
              mode: Mode.DIALOG,
              showSearchBox: true,
              onChanged: (value) => print(value?.toJson()),
              dropdownBuilder: (context, Kota? selectedItem) =>
                  Text(selectedItem?.name ?? "Belum memilih Kota"),
              popupItemBuilder: (context, Kota item, isSelected) => ListTile(
                title: Text(item.name),
              ),
              onFind: (text) async {
                var response = await http.get(Uri.parse(
                    "https://api.binderbyte.com/wilayah/kabupaten?api_key=$apiKey&id_provinsi=$idProvinsi"));
                if (response.statusCode != 200) {
                  return [];
                }
                List<dynamic> allKota = json.decode(response.body)["value"];
                List<Kota> allModelKota = [];

                allKota.forEach((element) {
                  allModelKota.add(Kota(
                      id: element["id"],
                      idProvinsi: element["id_provinsi"],
                      name: element["name"]));
                });
                return allModelKota;
              },
            ),
        ],
      ),
    );
  }
}
