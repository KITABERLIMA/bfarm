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
          foregroundColor: Colors.black, // Warna teks dan ikon di app bar menjadi hitam
        ),
      ),
      home: PengajuanListLahanPage(), // Menggunakan halaman AkunPenggunaPage sebagai home
    );
  }
}

class PengajuanListLahanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        title: Text(
          'Pengajuan List Lahan',
          style: TextStyle(color: Colors.black), // Warna teks menjadi hitam
        ),
        iconTheme: IconThemeData(color: Colors.black), // Warna ikon menjadi hitam
        backgroundColor: const Color(0xFFF7F7F7),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 10), // Memberikan ruang di atas objek pertama
              Group12860(),
              const SizedBox(height: 10), // Memberikan ruang di bawah objek terakhir
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
              title: 'Apakah ada persyaratan khusus yang harus dipenuhi untuk mengajukan daftar lahan?',
              answer: 'Pastikan untuk membaca panduan pengguna atau syarat dan ketentuan yang berlaku sebelum mengajukan.',
            ),
            buildListItem(
              title: 'Bagaimana proses verifikasi atau persetujuan dilakukan setelah pengajuan lahan?',
              answer: 'Setelah Anda mengajukan daftar lahan, tim aplikasi akan memeriksa informasi yang Anda berikan dan melakukan verifikasi kepemilikan lahan.',
            ),
            buildListItem(
              title: 'Berapa lama waktu yang dibutuhkan untuk mendapatkan persetujuan setelah mengajukan daftar lahan?',
              answer: 'Waktu yang dibutuhkan untuk mendapatkan persetujuan bervariasi tergantung pada antrean. Anda dapat memeriksa status pengajuan di history.',
            ),
            buildListItem(
              title: 'Bagaimana cara memeriksa status pengajuan lahan saya?',
              answer: 'Anda dapat memeriksa status pengajuan lahan Anda dengan klik ke “Riwayat” Anda dan status dari pengajuan Anda akan tampak.',
            ),
            buildListItem(
              title: 'Apakah ada biaya atau tarif yang harus dibayarkan saat mengajukan daftar lahan?',
              answer: 'Biaya atau tarif pengajuan lahan dapat bervariasi tergantung pada luas lahan. Biaya yang tercantum juga belum termasuk biaya akomodasi.',
            ),
            buildListItem(
              title: 'Bagaimana saya bisa mendapatkan bantuan jika mengalami masalah atau kesulitan saat mengajukan daftar lahan?',
              answer: 'Jika Anda mengalami masalah atau kesulitan, Anda dapat menghubungi tim bFarm melalui saluran komunikasi yang disediakan, seperti email atau whatsapp. Tim bFarm akan siap membantu Anda menyelesaikan masalah tersebut.',
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
              color: Colors.grey.shade800, // Menggunakan warna abu-abu yang lebih gelap
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
                      color: Colors.grey.shade800, // Menggunakan warna abu-abu yang lebih gelap
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