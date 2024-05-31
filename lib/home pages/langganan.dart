// ignore_for_file: unused_field

import 'package:flutter/material.dart';

void main() {
  runApp(const Langganan());
}

class Langganan extends StatelessWidget {
  const Langganan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 3;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: SizedBox(
          height: 70,
          child: Image.asset(
            'assets/images/13.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PilihPaketLangganan(),
          SizedBox(height: 32),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Frame1615(),
                    SizedBox(width: 16),
                    Frame1616(),
                    SizedBox(width: 16),
                    Frame1617(),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}

class PilihPaketLangganan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width, // Lebar responsif
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0), // Padding atas
      alignment: Alignment.topCenter, // Memindahkan teks ke tengah atas
      child: Text(
        'Pilih Paket Langganan',
        style: TextStyle(
          color: Color(0xFF6EBF45), // Warna teks seperti sebelumnya
          fontSize: 16,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
          letterSpacing: -0.45,
        ),
      ),
    );
  }
}

class Frame1615 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(maxWidth: 300),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: Color(0xFF6EBF45)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/images/classic.png',
                width: 100,
                height: 100,
                fit: BoxFit
                    .contain, // agar gambar terlihat sesuai dalam lingkaran
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'CLASSIC',
            style: TextStyle(
              color: Color(0xFF6EBF45),
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Paket Classic memberikan anda kelebihan untuk dapat mengakses informasi lahan:',
                style: TextStyle(
                  color: Color(0xFF6EBF45),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15),
              Text(
                'Akses informasi lahan 5x/hari',
                style: TextStyle(
                  color: Color(0xFF6EBF45),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Rp. 50.000',
                style: TextStyle(
                  color: Color(0xFF6EBF45),
                  fontSize: 24,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            height: 30.05,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, // Warna latar belakang
                backgroundColor: Colors.white, // Warna teks
                side: BorderSide(
                    color: Color(0xFF6EBF45), width: 1), // Border hijau
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'BUY',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF6EBF45), // Warna teks BUY
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Frame1616 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(maxWidth: 300),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: Color(0xFF6EBF45)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/images/silver.png',
                width: 100,
                height: 100,
                fit: BoxFit
                    .contain, // agar gambar terlihat sesuai dalam lingkaran
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'SILVER',
            style: TextStyle(
              color: Color(0xFF6EBF45),
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Paket Classic memberikan anda kelebihan untuk dapat mengakses informasi lahan:',
                style: TextStyle(
                  color: Color(0xFF6EBF45),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15),
              Text(
                'Akses informasi lahan 10x/hari',
                style: TextStyle(
                  color: Color(0xFF6EBF45),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Rp. 150.000',
                style: TextStyle(
                  color: Color(0xFF6EBF45),
                  fontSize: 24,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            height: 30.05,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, // Warna latar belakang
                backgroundColor: Colors.white, // Warna teks
                side: BorderSide(
                    color: Color(0xFF6EBF45), width: 1), // Border hijau
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'BUY',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF6EBF45), // Warna teks BUY
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Frame1617 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(maxWidth: 300),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: Color(0xFF6EBF45)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/images/gold.png',
                width: 100,
                height: 100,
                fit: BoxFit
                    .contain, // agar gambar terlihat sesuai dalam lingkaran
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'GOLD',
            style: TextStyle(
              color: Color(0xFF6EBF45),
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Paket Classic memberikan anda kelebihan untuk dapat mengakses informasi lahan:',
                style: TextStyle(
                  color: Color(0xFF6EBF45),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15),
              Text(
                'Akses informasi lahan 10x/hari',
                style: TextStyle(
                  color: Color(0xFF6EBF45),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Rp. 250.000',
                style: TextStyle(
                  color: Color(0xFF6EBF45),
                  fontSize: 24,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            height: 30.05,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, // Warna latar belakang
                backgroundColor: Colors.white, // Warna teks
                side: BorderSide(
                    color: Color(0xFF6EBF45), width: 1), // Border hijau
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'BUY',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF6EBF45), // Warna teks BUY
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
