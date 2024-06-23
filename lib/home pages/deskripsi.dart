import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

import 'pengajuan.dart';

void main() {
  runApp(Deskripsi());
}

class Deskripsi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Properti Kalimantan',
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Navigate back to previous screen
            },
          ),
        ),
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
                  color: const Color.fromARGB(255, 255, 255, 255),
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
                    'Ajukan Investor',
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ),
              SizedBox(width: 20),
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
        CarouselSlider(
          options: CarouselOptions(
            height: 200.0,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            viewportFraction: 0.8,
          ),
          items: [
            'assets/images/tanah.png',
            'assets/images/tanah.png',
            'assets/images/tanah.png',
          ].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                  child: Image.asset(i, fit: BoxFit.cover),
                );
              },
            );
          }).toList(),
        ),
        LandDetailPage(), // Add LandDetailPage widget here
      ],
    );
  }
}

class LandDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '42 966 Ha, Kalimantan',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: 8),
            Text(
              'Deskripsi:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              'Lahan subur seluas 5 hektar di pinggiran kota dengan panorama alam indah dan udara segar. Cocok untuk pertanian produktif, properti perumahan, atau investasi jangka panjang.',
            ),
            ListTile(
              leading: Icon(Icons.account_circle), // Ikon profil
              title: Text('Supardi'),
              subtitle: Text('supardimalang@gmail.com'),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Lokasi Lahan',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    'W5VJ+3F7, Kakap River, Sungai Kakap, Kubu Raya Regency, West Kalimantan 78381',
                  ),
                  SizedBox(height: 16),
                  MapWidget(),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
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
            options: MapOptions(
              initialCenter: _initialCenter!,
              initialZoom: 9.2,
            ),
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
