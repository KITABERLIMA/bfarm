import 'pembelian_alat.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Produk());
}

class Produk extends StatefulWidget {
  const Produk({Key? key}) : super(key: key);

  @override
  _ProdukState createState() => _ProdukState();
}

class _ProdukState extends State<Produk> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            ProductHeader(),
            SizedBox(height: 32),
            KontenProduk(),
            KontenProduk1()
          ],
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class ProductHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 16), // Menambahkan padding horizontal
      color: Color(0xFF6EBF45), // Warna latar belakang hijau
      child: Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 16),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Beranda()),
                );
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 24,
              ),
            ),
            SizedBox(width: 16),
            Text(
              'Produk',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class KontenProduk1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 386,
      height: 305,
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 55),
                child: Text(
                  'Alat Pengukur pH Tanah dan Kesuburan Tanah ETP303',
                  style: TextStyle(
                    color: Color(0xFF121212),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.06,
                  ),
                ),
              ),
              SizedBox(height: 12),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 55),
                child: Text(
                  'Perangkat modern yang dirancang khusus untuk membantu petani dan ahli pertanian dalam mengukur pH tanah serta tingkat kesuburan tanah dengan cepat dan akurat.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.06,
                  ),
                ),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 120,
                    padding: EdgeInsets.symmetric(horizontal: 16),
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
                margin: EdgeInsets.symmetric(
                    horizontal: 0,
                    vertical:
                        16), // Jarak antara pemisah dengan konten sekitarnya
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      5), // Melengkungkan kedua sisi pemisah
                  color:
                      Color(0xFFE0E0E0), // Warna pemisah abu-abu (Hexadecimal)
                ),
                height: 1, // Tinggi pemisah
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
      width: 386,
      height: 305,
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 55),
                child: Text(
                  'Alat Pengukur pH Tanah dan Kesuburan Tanah ETP303',
                  style: TextStyle(
                    color: Color(0xFF121212),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.06,
                  ),
                ),
              ),
              SizedBox(height: 12),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 55),
                child: Text(
                  'Perangkat modern yang dirancang khusus untuk membantu petani dan ahli pertanian dalam mengukur pH tanah serta tingkat kesuburan tanah dengan cepat dan akurat.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.06,
                  ),
                ),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 120,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: ElevatedButton(
                      onPressed: () {
                        // Aksi yang dijalankan saat tombol "Beli" ditekan
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
                margin: EdgeInsets.symmetric(
                    horizontal: 0,
                    vertical:
                        16), // Jarak antara pemisah dengan konten sekitarnya
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      5), // Melengkungkan kedua sisi pemisah
                  color:
                      Color(0xFFE0E0E0), // Warna pemisah abu-abu (Hexadecimal)
                ),
                height: 1, // Tinggi pemisah
              ),
            ],
          ),
        ],
      ),
    );
  }
}
