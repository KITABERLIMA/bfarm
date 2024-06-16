import 'CaraPembayaran.dart';
import 'StatusPembayaran.dart';
import 'DetailPemesanan.dart';
import 'pembelian_alat.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Total Tagihan',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const TagihanPage(
          totalAmount: 0), // Tampilkan halaman tagihan pertama kali
    );
  }
}

class TagihanPage extends StatelessWidget {
  final int totalAmount;
  const TagihanPage({Key? key, required this.totalAmount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tagihan'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const total_tagihan(selectedItems: 0)),
            );
          },
          child: const Text('Lihat Total Tagihan'),
        ),
      ),
    );
  }
}

class total_tagihan extends StatelessWidget {
  final int selectedItems;

  const total_tagihan({Key? key, required this.selectedItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final totalAmount = 60000 * selectedItems; // Calculate the total amount

    return Scaffold(
      body: ListView(
        children: [
          const IconSection(),
          const DeadlinePayment(),
          const AdditionalContent(),
          const AccountNumber(),
          TotalPayment(totalAmount: totalAmount),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(16.0),
          ),
        ],
      ),
    );
  }
}

class IconSection extends StatelessWidget {
  const IconSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 8),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(
                  context); // Kembali ke halaman sebelumnya (TagihanPage)
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          const Text(
            'Menunggu Pembayaran',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}

class DeadlinePayment extends StatelessWidget {
  const DeadlinePayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(35),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Batas Akhir Pembayaran',
                style: TextStyle(
                  color: Color(0xFF616161),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Senin, 22 Feb 2024   14:00',
                style: TextStyle(
                  color: Color(0xFF0A0A0A),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              // Handle detail button tap
            },
            child: const Text(
              '23:59:42',
              style: TextStyle(
                color: Color(0xFF6EBF45),
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AdditionalContent extends StatelessWidget {
  const AdditionalContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 35),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(2),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'BCA Virtual Account',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Image.asset(
                "assets/images/Bank.png",
                width: 40,
                height: 40,
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        const Divider(
          color: Color(0xFFE0E0E0),
          height: 1,
          thickness: 1,
          indent: 35,
          endIndent: 35,
        ),
      ],
    );
  }
}

class AccountNumber extends StatelessWidget {
  const AccountNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 35),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Nomor Virtual Account',
                style: TextStyle(
                  color: Color(0xFF616161),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '8077702468494411885',
                style: TextStyle(
                  color: Color(0xFF0A0A0A),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Clipboard.setData(
                const ClipboardData(text: '8077702468494411885'),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Nomor telah disalin')),
              );
            },
            child: Row(
              children: const [
                Text(
                  'Salin',
                  style: TextStyle(
                    color: Color(0xFF6EBF45),
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 4),
                Icon(
                  Icons.copy,
                  color: Color(0xFF6EBF45),
                  size: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TotalPayment extends StatelessWidget {
  final int totalAmount;

  const TotalPayment({Key? key, required this.totalAmount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 35),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Total Pembayaran',
            style: TextStyle(
              color: Color(0xFF616161),
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Rp. $totalAmount',
                style: const TextStyle(
                  color: Color(0xFF6EBF45),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Clipboard.setData(
                    ClipboardData(text: 'Rp. $totalAmount'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Nomor telah disalin')),
                  );
                },
                child: Row(
                  children: const [
                    SizedBox(
                        width:
                            8), // Menambahkan width: 8), // Menambahkan jarak antara ikon dan teks
                    Icon(
                      Icons.copy,
                      color: Color(0xFF6EBF45),
                      size: 16,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPemesanan(
                          totalAmount: totalAmount,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          'Lihat Detail',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color(0xFF6EBF45),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            height:
                                1.0, // Height diubah menjadi 1.0 untuk menyesuaikan line height
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(
            color: Color(0xFFE0E0E0),
            height: 1,
            thickness: 1,
            indent: 0,
            endIndent: 0,
          ),
          const SizedBox(height: 40),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CaraPembayaran(
                      totalAmount:
                          totalAmount), // Mengirim selectedItems ke halaman CaraPembayaran
                ),
              );
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Lihat Cara Pembayaran',
                    style: TextStyle(
                      color: Color(0xFF259898),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0.16,
                    ),
                  ),
                  SizedBox(height: 16),
                  const SizedBox(height: 8),
                  const Text(
                    'Pesanan baru diteruskan ke resepsionis setelah pembayaran terverifikasi',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF757575),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height:
                          1.5, // Increased line height for better readability
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Beranda()),
              );
            },
            child: Container(
              width: double.infinity,
              height: 32,
              decoration: ShapeDecoration(
                color: const Color(0xFF6EBF45),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    'Pesan Lagi',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PembayaranBerhasil()),
              );
            },
            child: Container(
              width: double.infinity,
              height: 32,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFF6EBF45)),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    'Cek Status Pembayaran',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF6EBF45),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
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
