import 'package:flutter/material.dart';
import 'keranjang.dart';

void main() {
  runApp(const FigmaToCodeApp());
}

class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 16),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Rectangle5(),
                  IconBack(),
                  Positioned(
                    bottom: 0,
                    child: Indicator(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 0),
            Rectangle6(),
            SizedBox(height: 15),
            RatingReviews(),
            SizedBox(height: 15),
            Tabbing(),
            SizedBox(height: 15),
            Dekripsi(),
            SizedBox(height: 8),
            Recommended(),
            ButtonAddToCart(),
          ],
        ),
      ),
    );
  }
}

class IconBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: 0,
      child: Container(
        width: 36.59,
        height: 32,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class Rectangle5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 319,
      child: Center(
        child: Image.asset('assets/images/alat.jpg'),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22.87,
      height: 4,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 4.57,
              height: 4,
              decoration: ShapeDecoration(
                color: Color(0xFF121212),
                shape: const CircleBorder(),
              ),
            ),
          ),
          Positioned(
            left: 9.15,
            top: 0,
            child: Opacity(
              opacity: 0.20,
              child: Container(
                width: 4.57,
                height: 4,
                decoration: ShapeDecoration(
                  color: Color(0xFF121212),
                  shape: const CircleBorder(),
                ),
              ),
            ),
          ),
          Positioned(
            left: 18.29,
            top: 0,
            child: Opacity(
              opacity: 0.20,
              child: Container(
                width: 4.57,
                height: 4,
                decoration: ShapeDecoration(
                  color: Color(0xFF121212),
                  shape: const CircleBorder(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Rectangle6 extends StatefulWidget {
  const Rectangle6({Key? key}) : super(key: key);

  @override
  _Rectangle6State createState() => _Rectangle6State();
}

class _Rectangle6State extends State<Rectangle6> {
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void decrementCounter() {
    setState(() {
      if (counter > 0) {
        counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              // Mengubah Column menjadi Row
              mainAxisAlignment: MainAxisAlignment
                  .spaceBetween, // Untuk menempatkan widget secara horizontal
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Alat XXXX',
                      style: TextStyle(
                        color: Color(0xFF121212),
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 0,
                        letterSpacing: 0.10,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Rp. 6.000.000',
                      style: TextStyle(
                        color: Color(0xFF6EBF45),
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.10,
                      ),
                    ),
                  ],
                ),
                Row(
                  // Menambahkan Row untuk ikon dan angka
                  children: [
                    GestureDetector(
                      onTap: decrementCounter,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: Colors.green,
                            width: 2,
                          ),
                        ),
                        child: Icon(
                          Icons.remove,
                          color: Colors.green,
                          size: 24,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      child: Text(
                        '$counter',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: incrementCounter,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: Colors.green,
                            width: 2,
                          ),
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.green,
                          size: 24,
                        ),
                      ),
                    ),
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

class RatingReviews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
          16.0), // Memberikan padding di sekitar konten RatingReviews
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(width: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 20,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 20,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 20,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 20,
                        ),
                        Icon(
                          Icons.star_half,
                          color: Colors.amber,
                          size: 20,
                        ),
                        SizedBox(width: 4),
                        Text(
                          '4.6',
                          style: TextStyle(
                            color: Color(0xFF121212),
                            fontSize: 18,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                    height:
                        8), // Menambahkan jarak antara ikon bintang dan teks review
                Row(
                  children: [
                    SizedBox(width: 8), // Menambahkan sedikit jarak horizontal
                    Text(
                      '98 Reviews',
                      style: TextStyle(
                        color: Color(0xFFAAAAAA),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.016,
                      ),
                    ),
                    SizedBox(
                        width:
                            12), // Menambahkan jarak antara teks dan ikon panah
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Color(0xFFAAAAAA),
                      size: 18,
                    ),
                  ],
                ),
                SizedBox(height: 8), // Menambahkan jarak vertikal
              ],
            ),
            SizedBox(
                width: 20), // Memberikan jarak antara kolom pertama dan kedua
            Expanded(
              // Menggunakan Expanded untuk memastikan gambar berada di sebelah kanan dan mengisi sisa ruang yang tersedia
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 32,
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            Spacer(), // Memberikan jarak agar gambar berada di sebelah kanan
                            Container(
                              width: 36.59,
                              height: 32,
                              decoration: ShapeDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/alat.jpg'), // Menggunakan AssetImage untuk gambar lokal
                                  fit: BoxFit.fill,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: BorderSide(
                                      width: 2, color: Color(0xFFF9F9F9)),
                                ),
                              ),
                            ),
                            // Menambahkan jarak antara gambar alat
                            Container(
                              width: 36.59,
                              height: 32,
                              decoration: ShapeDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/alat.jpg'), // Menggunakan AssetImage untuk gambar lokal
                                  fit: BoxFit.fill,
                                ),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 2, color: Color(0xFFF9F9F9)),
                                ),
                              ),
                            ),
                            // Menambahkan jarak antara gambar alat
                            Container(
                              width: 36.59,
                              height: 32,
                              decoration: ShapeDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/alat.jpg'), // Menggunakan AssetImage untuk gambar lokal
                                  fit: BoxFit.fill,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: BorderSide(
                                      width: 2, color: Color(0xFFF9F9F9)),
                                ),
                              ),
                            ),
                            // Menambahkan jarak antara gambar alat
                            Container(
                              width: 36.59,
                              height: 32,
                              decoration: ShapeDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/alat.jpg'), // Menggunakan AssetImage untuk gambar lokal
                                  fit: BoxFit.fill,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: BorderSide(
                                      width: 2, color: Color(0xFFF9F9F9)),
                                ),
                              ),
                            ),
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
      ),
    );
  }
}

class Tabbing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      child: Row(
        children: [
          buildTab("Deskripsi", isActive: true),
          buildTab("Produk"),
          buildTab("Ulasan"),
        ],
      ),
    );
  }

  Widget buildTab(String title, {bool isActive = false}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 24.0), // Menambahkan jarak horizontal
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: isActive ? Color(0x306EBF45) : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: isActive ? Color(0xFF6EBF45) : Color(0xFFAAAAAA),
                fontSize: 16,
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Dekripsi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 24.0), // Memberikan padding horizontal
      child: Column(
        children: [
          SizedBox(
            width: 800,
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consectetur velit at massa vehicula, quis fringilla urna gravida.',
              style: TextStyle(
                color: Color(0xFFAAAAAA),
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height:
                    1.5, // Menggunakan height untuk memberikan spasi antar baris
              ),
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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          RecommendedItem(), // Menambahkan item pertama
          SizedBox(width: 20), // Menambahkan jarak antara item
          RecommendedItem(), // Menambahkan item kedua
          SizedBox(width: 20), // Menambahkan jarak antara item
          RecommendedItem(), // Menambahkan item ketiga
          // Anda dapat menambahkan lebih banyak item di sini sesuai kebutuhan
        ],
      ),
    );
  }
}

class RecommendedItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260, // Lebar item
      height: 256, // Tinggi item
      padding: EdgeInsets.only(
          right:
              20.0), // Menambahkan padding hanya di sebelah kanan setiap konten
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 48,
            child: Container(
              width: 260, // Lebar konten
              height: 208, // Tinggi konten
              child: Stack(
                children: [
                  Positioned(
                    left: 30.62,
                    top: 0,
                    child: Container(
                      width: 179.51,
                      height: 208,
                      child: Column(
                        children: [
                          Container(
                            width: 179.51,
                            height: 155,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x19202020),
                                  blurRadius: 50,
                                  offset: Offset(0, 4),
                                  spreadRadius: -5,
                                )
                              ],
                            ),
                            child: Image.asset(
                                'assets/images/alat.jpg'), // Perhatikan bahwa path yang digunakan adalah 'assets/alat.jpg'
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Rp 3-.000',
                            style: TextStyle(
                              color: Color(0xFF121212),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.07,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Alat XXX',
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonAddToCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigasi ke halaman KeranjangPage ketika tombol ditekan
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                // ignore: prefer_const_constructors
                OrderPage(),
          ), // Menggunakan KeranjangPage dari keranjang.dart
        );
      },
      child: Container(
        width: 428.78,
        height: 75,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Color(0xFF6EBF45),
                  borderRadius: BorderRadius.circular(0),
                ),
                child: Center(
                  child: Text(
                    'Tambahkan ke keranjang',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.07,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
