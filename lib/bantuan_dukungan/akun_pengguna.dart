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
      home: AkunPenggunaPage(), // Menggunakan halaman AkunPenggunaPage sebagai home
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

class Group12860 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildListItem(
          title: 'Bagaimana cara membuat akun pengguna baru? ',
          context: context,
          answer: 'Untuk membuat akun baru, cukup klik tombol "Daftar" dan ikuti langkah-langkah pendaftarannya.', 
        ),
        const SizedBox(height: 16), // Memberikan ruang di antara objek pertama dan kedua
        buildListItem(
          title: 'Apa langkah-langkah untuk mengatur profil pengguna?',
          context: context,
          answer: 'Anda dapat mengatur profil pengguna Anda dengan masuk ke navbar "Akun" dan mengklik opsi "Edit Profil".', 
        ),
        const SizedBox(height: 16), // Memberikan ruang di antara objek kedua dan ketiga
        buildListItem(
          title: 'Bagaimana cara mengubah kata sandi atau informasi kontak dalam akun saya?',
          context: context,
          answer: 'Anda bisa mengubah kata sandi dengan masuk ke navbar "Akun" dan mengakses opsi "Kata Sandi".', 
        ),
        const SizedBox(height: 16), // Memberikan ruang di antara objek ketiga dan keempat
        buildListItem(
          title: 'Bagaimana cara melaporkan masalah atau bug dalam aplikasi?',
          context: context,
          answer: 'Apabila terdapat masalah atau bug Anda dapat menghubungi pihal bFarm di kanal yang sudah disediakan (WA dan Email)',
        ),
      ],
    );
  }

  Widget buildListItem({required String title, required BuildContext context, String? answer}) {
    return ExpansionTile(
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.black, // Warna teks hitam
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            height: 1.5,
          ),
        ),
      ),
      children: [
        if (answer != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white, // Warna background putih
                boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 4, offset: Offset(0, 2))], // Bayangan
                border: Border.all(color: const Color(0xFF6EBF45), width: 1), // Garis batas 
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                answer,
                style: TextStyle(
                  color: Colors.black, // Warna teks hitam
                  fontSize: 12,
                ),
                textAlign: TextAlign.justify, // Menjaga teks jawaban menjadi rapih
              ),
            ),
          ),
      ],
      tilePadding: const EdgeInsets.all(8.0), // Padding untuk seluruh tile
      trailing: Stack(
        children: [
          // Ikon panah putih yang lebih tebal
          Icon(
            Icons.chevron_right,
            color: Colors.white,
            size: 36,
          ),
          // Ikon panah hitam
          Positioned(
            left: 2,
            child: Icon(
              Icons.chevron_right,
              color: const Color(0xFF6EBF45), // Warna panah hitam
              size: 32, // Menyesuaikan ukuran panah
            ),
          ),
        ],
      ),
      collapsedBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
      iconColor: Colors.white,
    );
  }
}
