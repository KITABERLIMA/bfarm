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
          AkunPenggunaPage(), // Menggunakan halaman AkunPenggunaPage sebagai home
    );
  }
}

class AkunPenggunaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        title: Text(
          'Akun Pengguna',
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
              title: 'Bagaimana cara membuat akun pengguna baru?',
              answer:
                  'Untuk membuat akun baru, cukup klik tombol "Daftar" dan ikuti langkah-langkah pendaftarannya.',
            ),
            buildListItem(
              title: 'Apa langkah-langkah untuk mengatur profil pengguna?',
              answer:
                  'Anda dapat mengatur profil pengguna Anda dengan masuk ke navbar "Akun" dan mengklik opsi "Edit Profil".',
            ),
            buildListItem(
              title:
                  'Bagaimana cara mengubah kata sandi atau informasi kontak dalam akun saya?',
              answer:
                  'Anda bisa mengubah kata sandi dengan masuk ke navbar "Akun" dan mengakses opsi "Kata Sandi".',
            ),
            buildListItem(
              title:
                  'Bagaimana cara melaporkan masalah atau bug dalam aplikasi?',
              answer:
                  'Apabila terdapat masalah atau bug, Anda dapat menghubungi pihak bFarm melalui kanal yang sudah disediakan (WA dan Email).',
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
