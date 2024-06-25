import 'package:bfarm_mobileapp/pembayaran/pembayaran.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Langganan());
}

class Langganan extends StatelessWidget {
  const Langganan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hilangkan banner debug
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo.png', // Ganti dengan path logo Anda
              height: 40,
            ),
            SizedBox(width: 10),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            PilihPaketLangganan(),
            SizedBox(height: 24),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 16),
                  SubscriptionPackage(
                    imagePath: 'assets/images/classic.png',
                    title: 'CLASSIC',
                    description:
                        'Paket Classic memberikan Anda kelebihan untuk mengakses informasi lahan.',
                    accessInfo: 'Akses info lahan 5x/hari',
                    price: 'Rp. 50.000',
                  ),
                  SizedBox(width: 16),
                  SubscriptionPackage(
                    imagePath: 'assets/images/silver.png',
                    title: 'SILVER',
                    description:
                        'Paket Silver memberikan Anda kelebihan untuk mengakses informasi lahan.',
                    accessInfo: 'Akses info lahan 10x/hari',
                    price: 'Rp. 150.000',
                  ),
                  SizedBox(width: 16),
                  SubscriptionPackage(
                    imagePath: 'assets/images/gold.png',
                    title: 'GOLD',
                    description:
                        'Paket Gold memberikan Anda kelebihan untuk mengakses informasi lahan.',
                    accessInfo: 'Akses info lahan 20x/hari',
                    price: 'Rp. 250.000',
                  ),
                  SizedBox(width: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PilihPaketLangganan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(16, 16, 16, 0), // Atur padding atas di sini
      alignment: Alignment.topCenter,
      child: Text(
        'Pilih Paket Langganan',
        style: TextStyle(
          color: Color(0xFF6EBF45),
          fontSize: 25,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
          letterSpacing: -0.45,
        ),
      ),
    );
  }
}

class SubscriptionPackage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final String accessInfo;
  final String price;

  const SubscriptionPackage({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.accessInfo,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250, // Lebar tetap untuk setiap kartu
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16, 20, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    imagePath,
                    width: 80,
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  title,
                  style: TextStyle(
                    color: Color(0xFF6EBF45),
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    color: Color(0xFF6EBF45),
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 4),
                Text(
                  accessInfo,
                  style: TextStyle(
                    color: Color(0xFF6EBF45),
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  price,
                  style: TextStyle(
                    color: Color(0xFF6EBF45),
                    fontSize: 22,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 36,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Pembayaran(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF6EBF45),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'BUY',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
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
