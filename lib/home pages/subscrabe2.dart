import 'package:bfarm_mobileapp/home%20pages/PembayaranLangganan1.dart';
import 'package:flutter/material.dart';
import 'package:bfarm_mobileapp/home%20pages/lahan.dart' as lahan;
import 'package:bfarm_mobileapp/home%20pages/subscrabe2.dart' as langganan;
import 'package:bfarm_mobileapp/home%20pages/history.dart' as history;
import 'package:bfarm_mobileapp/profile/profile.dart' as profile;
import 'package:bfarm_mobileapp/home%20pages/Dashboard.dart' as beranda;

void main() {
  runApp(const BFarmHomePage());
}

class BFarmHomePage extends StatefulWidget {
  const BFarmHomePage({Key? key}) : super(key: key);

  @override
  _BFarmHomePageState createState() => _BFarmHomePageState();
}

class _BFarmHomePageState extends State<BFarmHomePage> {
  int _selectedIndex = 3; // Set initial index to 'Langganan'

  static final List<Widget> _widgetOptions = <Widget>[
    beranda.Dashboard(), // Index 0: Dashboard page
    lahan.LahanPage(), // Index 1: Lahan page
    history.riwayat(), // Index 2: Riwayat page
    langganan.BFarmHomePage(), // Index 3: Langganan page
    profile.Profile(), // Index 4: Profile page
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _widgetOptions.elementAt(_selectedIndex),
          if (_selectedIndex != 0) // Hide BottomNavigationBar on Dashboard page
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: BottomNavigationBar(
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
                unselectedLabelStyle: const TextStyle(color: Colors.grey),
                selectedLabelStyle: const TextStyle(color: Colors.white),
                backgroundColor: Colors.white,
                type: BottomNavigationBarType.fixed,
                showUnselectedLabels: true,
              ),
            ),
        ],
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            PilihPaketLangganan(),
            const SizedBox(height: 24),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
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
  const PilihPaketLangganan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding:
          const EdgeInsets.fromLTRB(16, 16, 16, 0), // Adjust top padding here
      alignment: Alignment.topCenter,
      child: const Text(
        'Pilih Paket Langganan 2',
        style: TextStyle(
          color: Color(0xFF6EBF45),
          fontSize: 18,
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
      width: 250, // Fixed width for each card
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
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
                const SizedBox(height: 16),
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF6EBF45),
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(
                    color: Color(0xFF6EBF45),
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  accessInfo,
                  style: const TextStyle(
                    color: Color(0xFF6EBF45),
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  price,
                  style: const TextStyle(
                    color: Color(0xFF6EBF45),
                    fontSize: 22,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 36,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PembayaranLangganan1(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6EBF45),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
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
