import 'package:bfarm_mobileapp/home%20pages/deskripsibelumterpetakan.dart';
import 'package:bfarm_mobileapp/home%20pages/detailbelumterpetakan.dart';
import 'package:bfarm_mobileapp/home%20pages/detailterpetakan.dart';
import 'package:bfarm_mobileapp/home%20pages/kalimantan.dart';
import 'package:bfarm_mobileapp/profile/profile.dart' as profile;
import 'package:bfarm_mobileapp/pembayaran/pembelian_alat.dart';
import 'package:flutter/material.dart';
import 'deskripsi.dart';
import 'package:bfarm_mobileapp/home%20pages/lahan.dart' as lahan;
import 'package:bfarm_mobileapp/home%20pages/langganan.dart' as langganan;
import 'package:bfarm_mobileapp/home%20pages/history.dart' as history;

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
    lahan.LahanPage(),
    history.riwayat(),
    langganan.Langganan(),
    profile.Profile()
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
                        builder: (context) => FilterPage1(),
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
          SizedBox(height: 16), // Tambahkan jarak sebelum rekomendasi
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Lahan Terpetakan',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Implementasi aksi untuk tombol "Lihat Semua"

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => detailterpetakan(),
                          ),
                        );
                      },
                      child: Text(
                        'Lihat Semua',
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16), // Tambahkan jarak sebelum rekomendasi
                Recommended(), // Tambahkan widget Recommended di sini
              ],
            ),
          ),
          SizedBox(height: 16), // Tambahkan jarak sebelum rekomendasi
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Lahan Belum Terpetakan',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Implementasi aksi untuk tombol "Lihat Semua"

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => detailbelumterpetakan(),
                          ),
                        );
                      },
                      child: Text(
                        'Lihat Semua',
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16), // Tambahkan jarak sebelum rekomendasi
                Recommended1(), // Tambahkan widget Recommended di sini
              ],
            ),
          ),
          SizedBox(height: 16), // Tambahkan jarak sebelum rekomendasi
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Produk B-Farm',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Beranda(),
                          ),
                        );
                      },
                      child: Text(
                        'Lihat Semua',
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16), // Tambahkan jarak sebelum rekomendasi
                Recommended2(), // Tambahkan widget Recommended di sini
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Recommended extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300, // Sesuaikan ketinggian dengan konten yang sesuai
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10, // Ganti dengan jumlah item yang ingin ditampilkan
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: SizedBox(
              width: 250, // Sesuaikan lebar item dengan kebutuhan Anda
              child: RecommendedItem(
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

class RecommendedItem extends StatelessWidget {
  final String imageUrl;
  final String location;
  final String name;
  final String tgl;

  RecommendedItem({
    required this.imageUrl,
    required this.location,
    required this.name,
    required this.tgl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0), // Tambahkan padding
      child: Container(
        width: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey), // Menambahkan border
          boxShadow: [
            BoxShadow(
              color: Color(0x19202020),
              blurRadius: 50,
              offset: Offset(0, 4),
              spreadRadius: -5,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 250, // Sesuaikan lebar dengan kotak
              height: 120, // Sempitkan tinggi gambar
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover, // Menyesuaikan gambar dengan ukuran kotak
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(
                  8.0), // Tambahkan padding dalam container
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Navigasi ke deskripsi lahan terpetakan
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Deskripsi(),
                            ),
                          );
                        },
                        child: Text(
                          'Terpetakan',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.green, // Warna latar belakang hijau
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                5), // Set radius menjadi 5
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    location,
                    style: TextStyle(
                      color: Color(0xFF121212),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.07,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    name,
                    style: TextStyle(
                      color: Color(0xFF121212),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.07,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    tgl,
                    style: TextStyle(
                      color: Color(0xFFAAAAAA),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.06,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Recommended1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300, // Sesuaikan ketinggian dengan konten yang sesuai
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10, // Ganti dengan jumlah item yang ingin ditampilkan
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: SizedBox(
              width: 250, // Sesuaikan lebar item dengan kebutuhan Anda
              child: RecommendedItem1(
                imageUrl: 'assets/images/tanah.png',
                location: '42 966 Ha, Kalimantan',
                name: 'Supardi',
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

  RecommendedItem1({
    required this.imageUrl,
    required this.location,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0), // Tambahkan padding
      child: Container(
        width: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey), // Menambahkan border
          boxShadow: [
            BoxShadow(
              color: Color(0x19202020),
              blurRadius: 50,
              offset: Offset(0, 4),
              spreadRadius: -5,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 250, // Sesuaikan lebar dengan kotak
              height: 120, // Sempitkan tinggi gambar
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover, // Menyesuaikan gambar dengan ukuran kotak
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(
                  8.0), // Tambahkan padding dalam container
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Deskripsibelumterpetakan(),
                            ),
                          );
                        },
                        child: Text(
                          'Belum Terpetakan',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(
                              255, 219, 8, 8), // Warna latar belakang hijau
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                5), // Set radius menjadi 5
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    location,
                    style: TextStyle(
                      color: Color(0xFF121212),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.07,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    name,
                    style: TextStyle(
                      color: Color(0xFF121212),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.07,
                    ),
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Recommended2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300, // Sesuaikan ketinggian dengan konten yang sesuai
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10, // Ganti dengan jumlah item yang ingin ditampilkan
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: SizedBox(
              width: 250, // Sesuaikan lebar item dengan kebutuhan Anda
              child: RecommendedItem2(
                imageUrl: 'assets/images/alat.png',
                alat: 'Alat xxx',
                harga: 'Rp 17.000',
              ),
            ),
          );
        },
      ),
    );
  }
}

class RecommendedItem2 extends StatelessWidget {
  final String imageUrl;
  final String harga;
  final String alat;

  RecommendedItem2({
    required this.imageUrl,
    required this.harga,
    required this.alat,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0), // Tambahkan padding
      child: Container(
        width: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey), // Menambahkan border
          boxShadow: [
            BoxShadow(
              color: Color(0x19202020),
              blurRadius: 50,
              offset: Offset(0, 4),
              spreadRadius: -5,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 250, // Sesuaikan lebar dengan kotak
              height: 120, // Sempitkan tinggi gambar
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover, // Menyesuaikan gambar dengan ukuran kotak
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(
                  8.0), // Tambahkan padding dalam container
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      height:
                          8), // Tambahkan jarak antara harga dan tombol "Beli"
                  Text(
                    harga,
                    style: TextStyle(
                      color: Color(0xFF121212),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.07,
                    ),
                  ),
                  SizedBox(
                      height: 8), // Tambahkan jarak antara harga dan nama alat
                  Text(
                    alat,
                    style: TextStyle(
                      color: Color(0xFFAAAAAA),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.06,
                    ),
                  ),
                  SizedBox(
                      height:
                          8), // Tambahkan jarak antara nama alat dan tombol "Beli"
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Beranda(),
                          ));
                    },
                    child: Text(
                      'Beli',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.green, // Warna latar belakang hijau
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(5), // Set radius menjadi 5
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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
  // ignore: unused_field
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => kalimantan(),
                      ),
                    );
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
