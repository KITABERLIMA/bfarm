// ignore_for_file: unused_field

import 'package:bfarm_mobileapp/home%20pages/akun.dart';
import 'package:flutter/material.dart';
import 'lahan.dart';
import 'langganan.dart';
import 'riwayat.dart';

void main() {
  runApp(Dashboard());
}

class Dashboard extends StatelessWidget {
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
    LahanPage(),
    RiwayatPage(),
    Langganan(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset('assets/images/logo.png', height: 40),
                SizedBox(width: 10),
              ],
            ),
          ],
        ),
      ),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Cari Lahan, Produk B-Farm',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                            color: Colors.green,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Padding(
                          padding:
                              const EdgeInsets.only(left: 12.0, right: 8.0),
                          child: Icon(Icons.search,
                              color: Colors.green), // Ubah warna ikon
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 16.0),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.tune, color: Colors.green),
                  onPressed: () {
                    // Handle filter action
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FilterPage1(),
                      ),
                    );
                  },
                ),
                const SizedBox(width: 4.0),
                // Link ke halaman filter.dart
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FilterPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Filter',
                    style: TextStyle(fontSize: 16, color: Colors.green),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16), // Tambahkan jarak di sini
          DefaultTabController(
            length: 5,
            child: Column(
              children: <Widget>[
                TabBar(
                  labelColor: Colors.green,
                  indicatorColor: Colors.green,
                  tabs: [
                    Tab(text: 'Semua'),
                    Tab(text: 'Kalimantan'),
                    Tab(text: 'Sumatera'),
                    Tab(text: 'Surabaya'),
                    Tab(text: 'Malang'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FilterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bFARM',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: FilterPage1(),
    );
  }
}

class FilterPage1 extends StatefulWidget {
  @override
  _FilterPage1State createState() => _FilterPage1State();
}

class _FilterPage1State extends State<FilterPage1> {
  bool _resetFilter = false;

  void _handleReset() {
    setState(() {
      _resetFilter = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
      ),
      body: ListView(
        children: <Widget>[
          FilterSection(title: 'Lokasi Berdasarkan Provinsi', options: [
            'Jawa Timur',
            'Jawa Barat',
            'Jawa Tengah',
            'Sumatera Utara',
            'Sumatera Selatan',
            'Sulawesi Utara',
            'Kalimantan Timur',
            'Kalimantan Barat',
            'Kalimantan Selatan',
            'Lampung',
            'Riau',
            'Jambi'
          ]),
          FilterSection(title: 'Lokasi Berdasarkan Kota', options: [
            'Surabaya',
            'Banjarmasin',
            'Malang',
            'Balikpapan',
            'Pontianak',
            'Samarinda',
            'Medan',
            'Makasar',
            'Manando',
            'DKI Jakarta'
          ]),
          FilterSection(
              title: 'Tipe Lahan', options: ['Terpetakan', 'Belum Terpetakan']),
          FilterSection(
              title: 'Tipe Langganan', options: ['Classic', 'Silver', 'Gold']),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Handle apply action
                  },
                  child: Text(
                    'Pakai',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                OutlinedButton(
                  onPressed: () {
                    // Reset semua nilai isSelected ke false
                  },
                  child: Text(
                    'Atur Ulang',
                    style: TextStyle(color: Colors.green),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.green),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FilterSection extends StatefulWidget {
  final String title;
  final List<String> options;

  FilterSection({required this.title, required this.options});

  @override
  _FilterSectionState createState() => _FilterSectionState();
}

class _FilterSectionState extends State<FilterSection> {
  List<bool> _isSelected = [];

  @override
  void initState() {
    super.initState();
    _isSelected = List<bool>.filled(widget.options.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(widget.title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        Wrap(
          children: List.generate(
            widget.options.length,
            (index) => Padding(
              padding: const EdgeInsets.all(4.0),
              child: FilterChip(
                label: Text(widget.options[index]),
                selected: _isSelected[index],
                onSelected: (selected) {
                  setState(() {
                    _isSelected[index] = selected;
                  });
                },
                selectedColor: Colors.green,
                checkmarkColor: Colors.white,
                labelStyle: TextStyle(
                  color: _isSelected[index] ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
