import 'package:flutter/material.dart';

void main() {
  runApp(const FigmaToCodeApp());
}

class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF7F7F7),
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFFF7F7F7),
          foregroundColor:
              Colors.black, // Warna teks dan ikon di app bar menjadi hitam
        ),
      ),
      home:
          PembayaranPage(), // Menggunakan halaman AkunPenggunaPage sebagai home
    );
  }
}

class PembayaranPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        title: Text(
          'Pembayaran',
          style: TextStyle(color: Colors.black), // Warna teks menjadi hitam
        ),
        iconTheme:
            IconThemeData(color: Colors.black), // Warna ikon menjadi hitam
        backgroundColor: const Color(0xFFF7F7F7),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                  height: 10), // Memberikan ruang di atas objek pertama
              Group12860(),
              const SizedBox(
                  height: 10), // Memberikan ruang di bawah objek terakhir
            ],
          ),
        ),
      ),
    );
  }
}

class Group12860 extends StatefulWidget {
  @override
  _Group12860State createState() => _Group12860State();
}

class _Group12860State extends State<Group12860> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildListItem(
              title: 'Apa metode pembayaran yang tersedia di aplikasi ini?',
              answer:
                  'Kartu kredit/debit, bank transfer, virtual account, e-Wallet, retail outlet, internet banking dan mobile banking.',
            ),
            buildListItem(
              title:
                  'Apakah ada biaya tambahan yang akan dikenakan untuk metode pembayaran tertentu?',
              answer:
                  'Biaya tambahan untuk metode pembayaran tertentu dapat bervariasi tergantung pada kebijakan Midtrans dan penyedia layanan pembayaran (bank atau penyedia e-wallet).',
            ),
            buildListItem(
              title:
                  'Apakah ada biaya tambahan yang harus saya bayarkan selain harga produk?',
              answer:
                  'Ada, untuk produk harga yang tercantum belum termasuk biaya pengiriman dan untuk pemeriksaan lahan belum termasuk biaya akomodasi.',
            ),
            buildListItem(
              title:
                  'Bagaimana saya bisa melihat bukti pembayaran setelah proses pembayaran selesai?',
              answer:
                  'Anda dapat melihat bukti pembayaran yang telah anda lakukan pada navbar "Histori"',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListItem({
    required String title,
    required String answer,
  }) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ExpansionTile(
        title: Padding(
          padding: EdgeInsetsDirectional.only(start: 0),
          child: Text(
            title,
            style: TextStyle(
              color: Colors
                  .grey.shade800, // Menggunakan warna abu-abu yang lebih gelap
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        trailing: Icon(
          Icons.expand_more,
          color: Colors.green,
        ),
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: double.infinity),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Text(
                    answer,
                    style: TextStyle(
                      color: Colors.grey
                          .shade800, // Menggunakan warna abu-abu yang lebih gelap
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.start,
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
