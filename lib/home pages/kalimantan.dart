import 'package:flutter/material.dart';
import 'Dashboard.dart'; // Sesuaikan dengan path yang sesuai
import 'Deskripsi.dart'; // Pastikan path menuju file Deskripsi benar
import 'package:bfarm_mobileapp/home%20pages/lahan.dart' as lahan;
import 'package:bfarm_mobileapp/home%20pages/langganan.dart' as langganan;
import 'package:bfarm_mobileapp/home%20pages/history.dart' as history;
import 'package:bfarm_mobileapp/profile/profile.dart' as profile;

void main() {
  runApp(kalimantan());
}

class kalimantan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bFARM',
      theme: ThemeData(
        primaryColor: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BFarmHomePage(),
    );
  }
}

class BFarmHomePage extends StatefulWidget {
  @override
  _BFarmHomePageState createState() => _BFarmHomePageState();
}

class _BFarmHomePageState extends State<BFarmHomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    BerandaPage(),
    lahan.LahanPage(),
    history.riwayat(),
    langganan.Langganan(),
    profile.Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 0
          ? AppBar(
              backgroundColor: Colors.green,
              title: Row(
                children: [
                  SizedBox(width: 10),
                  Text(
                    'Kalimantan',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Dashboard(),
                    ),
                  );
                },
              ),
            )
          : null,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.eco),
            label: 'Lahan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Riwayat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions),
            label: 'Langganan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Akun',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green[800],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        selectedLabelStyle: TextStyle(color: Colors.white),
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class BerandaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [],
                ),
                SizedBox(height: 16),
                Recommended1(),
              ],
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}

class Recommended1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Center(
              child: RecommendedItem1(
                imageUrl: 'assets/images/tanah.png',
                location: '42 966 Ha, Kalimantan',
                name: 'Supardi',
                tgl: 'Terpetakan 12/02/2024',
              ),
            ),
          );
        },
      ),
    );
  }
}

class RecommendedItem1 extends StatelessWidget {
  final String imageUrl;
  final String location;
  final String name;
  final String tgl;

  const RecommendedItem1({
    required this.imageUrl,
    required this.location,
    required this.name,
    required this.tgl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: GestureDetector(
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    imageUrl,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 8,
                  left: 8,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Deskripsi(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Terpetakan',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              location,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              name,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            Text(
              tgl,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LahanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Halaman Lahan'),
      ),
    );
  }
}

class Riwayat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Halaman Riwayat'),
      ),
    );
  }
}

class Langganan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Halaman Langganan'),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Halaman Profile'),
      ),
    );
  }
}
