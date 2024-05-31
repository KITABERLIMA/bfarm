import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
                width: MediaQuery.of(context).size.width *
                    0.45, // Menyesuaikan lebar layar
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
                width: MediaQuery.of(context).size.width *
                    0.45, // Menyesuaikan lebar layar
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

class MapWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Image.asset('assets/images/map.png', fit: BoxFit.cover),
    );
  }
}
