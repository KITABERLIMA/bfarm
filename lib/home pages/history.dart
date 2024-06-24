import 'package:flutter/material.dart';

void main() {
  runApp(const riwayat());
}

class riwayat extends StatelessWidget {
  const riwayat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riwayat',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: const RiwayatPage(),
    );
  }
}

class RiwayatPage extends StatefulWidget {
  const RiwayatPage({super.key});

  @override
  _RiwayatPageState createState() => _RiwayatPageState();
}

class _RiwayatPageState extends State<RiwayatPage> {
  void _onItemTapped(int index) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo.png', // Ganti dengan path logo Anda
              height: 40,
            ),
            SizedBox(width: 10),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 227, 234, 227),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExampleWidget(),
          SizedBox(height: 2),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              'Riwayat Terbaru',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w800,
                height: 1.5,
              ),
            ),
          ),
          SizedBox(height: 15),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                Frame65(),
                SizedBox(height: 10),
                Frame66(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ExampleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 16.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          width: 100,
          height: 29.08,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage("assets/images/13.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class Frame65 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Colors.black.withOpacity(0.2),
          ),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lahan xxxx',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '1 Sep 2024 - 1 Sep 2024',
            style: TextStyle(
              color: Colors.black.withOpacity(0.6),
              fontSize: 10,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Lahan yang memiliki luas 1Ha yang bertepatan di gununga anyar jaya yang memiliki tipe tanah gambut',
            style: TextStyle(
              color: Colors.black.withOpacity(0.4),
              fontSize: 12,
              fontFamily: 'Roboto Flex',
              fontWeight: FontWeight.w400,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              decoration: ShapeDecoration(
                color: Color(0xFF6EBF45),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: Text(
                'Selesai',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'Roboto Flex',
                  fontWeight: FontWeight.w700,
                  height: 1.1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Frame66 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Colors.black.withOpacity(0.2),
          ),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lahan xxxx',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '1 Sep 2024 - 1 Sep 2024',
            style: TextStyle(
              color: Colors.black.withOpacity(0.6),
              fontSize: 10,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Lahan yang memiliki luas 1Ha yang bertepatan di gununga anyar jaya yang memiliki tipe tanah gambut',
            style: TextStyle(
              color: Colors.black.withOpacity(0.4),
              fontSize: 12,
              fontFamily: 'Roboto Flex',
              fontWeight: FontWeight.w400,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              decoration: ShapeDecoration(
                color: Color.fromARGB(255, 243, 219, 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: Text(
                'Belum Selesai',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'Roboto Flex',
                  fontWeight: FontWeight.w700,
                  height: 1.1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
