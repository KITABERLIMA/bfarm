import 'package:bfarm_mobileapp/home%20pages/Dashboard.dart';
import 'package:bfarm_mobileapp/pembayaran/pembelian_alat.dart';
import 'package:flutter/material.dart';
import 'package:bfarm_mobileapp/home%20pages/lahan.dart' as lahan;
import 'package:bfarm_mobileapp/home%20pages/langganan.dart' as langganan;
import 'package:bfarm_mobileapp/home%20pages/history.dart' as history;
import 'package:bfarm_mobileapp/profile/profile.dart' as profile;

void main() {
  runApp(Produk());
}

class Produk extends StatefulWidget {
  @override
  _ProdukState createState() => _ProdukState();
}

class _ProdukState extends State<Produk> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    BerandaPage(),
    lahan.LahanPage(),
    history.riwayat(),
    langganan.Langganan(),
    profile.Profile()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _widgetOptions,
        ),
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
      ),
    );
  }
}

class KontenProduk1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 161.22,
            height: 149,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset(
              'assets/images/ProductAlat.png',
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Alat Pengukur pH Tanah dan Kesuburan Tanah ETP303',
                style: TextStyle(
                  color: Color(0xFF121212),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.06,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'Perangkat modern yang dirancang khusus untuk membantu petani dan ahli pertanian dalam mengukur pH tanah serta tingkat kesuburan tanah dengan cepat dan akurat.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.06,
                ),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 120,
                    child: ElevatedButton(
                      onPressed: () {
                        // Aksi yang dijalankan saat tombol "Beli" ditekan
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF6EBF45),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: Text(
                        'Beli',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          height: 0.11,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 0, vertical: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xFFE0E0E0),
                ),
                height: 1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class KontenProduk extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 161.22,
            height: 149,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset(
              'assets/images/ProductAlat.png',
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Alat Pengukur pH Tanah dan Kesuburan Tanah ETP303',
                style: TextStyle(
                  color: Color(0xFF121212),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.06,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'Perangkat modern yang dirancang khusus untuk membantu petani dan ahli pertanian dalam mengukur pH tanah serta tingkat kesuburan tanah dengan cepat dan akurat.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.06,
                ),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 120,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Beranda()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6EBF45),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: Text(
                        'Beli',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          height: 0.11,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 0, vertical: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xFFE0E0E0),
                ),
                height: 1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BerandaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
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
        title: Text(
          'Produk Bfarm',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          SizedBox(height: 16),
          KontenProduk(),
          KontenProduk1(),
          // Tambahkan widget KontenProduk lainnya jika diperlukan
        ],
      ),
    );
  }
}
