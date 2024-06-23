import 'package:bfarm_mobileapp/home%20pages/Dashboard.dart';
import 'package:bfarm_mobileapp/home%20pages/tagihan.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

import 'pengajuan.dart';

void main() {
  runApp(Deskripsibelumterpetakan());
}

class Deskripsibelumterpetakan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Properti Kalimantan',
      home: Scaffold(
        body: PropertyListing(),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.green),
                  color: Colors.white,
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => tagihan(
                            selectedItems:
                                0), // Provide a value for selectedItems
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  child: Text(
                    'Ajukan Investor',
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.green,
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Pengajuan(),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  child: Text(
                    'Ajukan Mandiri',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PropertyListing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Stack(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.3,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 1.0,
              ),
              items: [
                'assets/images/tanah.png',
                'assets/images/tanah.png',
                'assets/images/tanah.png',
              ].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                        ),
                        child: Image.asset(i, fit: BoxFit.cover),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Positioned(
              top: 16,
              left: 16,
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Dashboard(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '42 966 Ha, Kalimantan',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Divider(), // Pemisah antara judul dan deskripsi
              Text(
                'Deskripsi:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                'Lahan subur seluas 5 hektar di pinggiran kota dengan panorama alam indah dan udara segar. Akses mudah ke jalan utama dan fasilitas umum. Cocok untuk pertanian produktif, properti perumahan, atau investasi jangka panjang. Topografi variatif dengan sebagian datar dan sebagian berkontur lembut. Sumber air cukup dan iklim mendukung. Siap dibudidayakan atau dikembangkan sesuai visi investor atau pembeli.',
              ),
              SizedBox(height: 8),

              Divider(),
              ListTile(
                leading: Icon(Icons.account_circle), // Ikon profil
                title: Text('Pemilik Lahan'),
                subtitle: Text('Supardi\nsupardimalang@gmail.com'),
              ),
              Divider(),
              Text(
                'Lokasi Lahan',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                'W5VJ+3F7, Kakap River, Sungai Kakap, Kubu Raya Regency, West Kalimantan 78381',
              ),
              SizedBox(height: 16),
              Container(
                height: 200,
                child: MapWidget(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MapWidget extends StatefulWidget {
  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  LatLng? _initialCenter;

  @override
  void initState() {
    super.initState();
    _fetchLandData();
  }

  Future<void> _fetchLandData() async {
    final response =
        await http.get(Uri.parse('http://bfarm.ahmadyaz.my.id/api/lands/list'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final land = data['data'][0];
      final location = land['location'].split(',');
      final latitude = double.parse(location[0]);
      final longitude = double.parse(location[1]);

      setState(() {
        _initialCenter = LatLng(latitude, longitude);
      });
    } else {
      throw Exception('Failed to load land data');
    }
  }

  void launchUrl(Uri uri) async {
    if (await canLaunch(uri.toString())) {
      await launch(uri.toString());
    } else {
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return _initialCenter == null
        ? Center(child: CircularProgressIndicator())
        : FlutterMap(
            options: MapOptions(),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              RichAttributionWidget(
                attributions: [
                  TextSourceAttribution(
                    'OpenStreetMap contributors',
                    onTap: () => launchUrl(
                        Uri.parse('https://openstreetmap.org/copyright')),
                  ),
                ],
              ),
            ],
          );
  }
}
