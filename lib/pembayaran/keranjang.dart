import 'package:flutter/material.dart';

void main() {
  runApp(FigmaToCodeApp());
}

class FigmaToCodeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(
            255, 18, 32, 47), // Atur warna latar belakang keseluruhan aplikasi
      ),
      home: Scaffold(
        appBar: AppBar(), // Tidak ada judul pada app bar
        body: ListView(
          children: [
            OrderPage(), // Memuat halaman pesanan
          ],
        ),
      ),
    );
  }
}

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int counter = 1; // Variabel untuk menyimpan jumlah pesanan

  // Fungsi untuk menambah jumlah pesanan
  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  // Fungsi untuk mengurangi jumlah pesanan
  void decrementCounter() {
    setState(() {
      if (counter > 1) {
        counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16), // Atur padding pada konten
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop(); // Kembali ke halaman sebelumnya
                },
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(width: 8),
              Text(
                'Keranjang Saya', // Judul halaman
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.none, // Menghilangkan underline
                ),
              ),
            ],
          ),
          SizedBox(height: 16), // Tambahkan jarak antara judul dan konten
          Container(
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white, // Warna latar belakang kontainer
              borderRadius: BorderRadius.circular(
                  12), // Border radius untuk tampilan yang lebih lembut
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(
                      0.2), // Efek bayangan untuk tampilan yang lebih dalam
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            "assets/images/alat.jpg"), // Gambar produk
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 3,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Alat XXXX', // Nama produk
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          decoration:
                              TextDecoration.none, // Menghilangkan underline
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: decrementCounter,
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Color(0xFF6EBF45), // Warna tombol kurang
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Icon(Icons.remove,
                                  color: Colors.white), // Ikon kurang
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            '$counter', // Jumlah pesanan
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                decoration: TextDecoration.none),
                          ),
                          SizedBox(width: 8),
                          GestureDetector(
                            onTap: incrementCounter,
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Color(0xFF6EBF45), // Warna tombol tambah
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Icon(Icons.add,
                                  color: Colors.white), // Ikon tambah
                            ),
                          ),
                          SizedBox(
                            width: 700,
                            child: Text(
                              'RP 60.000',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  color: Color(0xFF6EBF45),
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.none),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
