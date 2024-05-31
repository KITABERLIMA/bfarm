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
      home: PenambahanListLahanPage(), // Menggunakan halaman AkunPenggunaPage sebagai home
    );
  }
}

class PenambahanListLahanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        title: Text(
          'Penambahan List Lahan',
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
              title: 'Bagaimana cara menambahkan lahan baru ke dalam daftar saya?',
              answer: 'Untuk menambahkan lahan baru, Anda dapat masuk ke akun Anda, pilih navbar "Lahan" lalu klik button tambah dan ikuti langkah-langkah yang disediakan untuk memasukkan informasi tentang lahan tersebut.',
            ),
            buildListItem(
              title: 'Apakah ada batasan jumlah lahan yang dapat saya tambahkan ke dalam daftar saya?',
              answer: 'Secara umum, tidak ada batasan jumlah lahan yang dapat Anda tambahkan ke dalam daftar Anda, namun tergantung pada kebijakan dan kapasitas penyimpanan aplikasi.',
            ),
            buildListItem(
              title: 'Apa langkah-langkah yang harus saya ikuti untuk mengunggah informasi lahan dengan benar?',
              answer: 'Langkah-langkahnya meliputi masuk ke menu Lahan, klik button tambah, masukkan detail yang diminta seperti lokasi, luas, dan informasi lainnya, dan simpan informasi yang dimasukkan.',
            ),
            buildListItem(
              title: 'Apakah saya perlu memasukkan semua detail tentang lahan atau ada informasi yang opsional?',
              answer: 'Semua informasi yang ada di form untuk penambahan list lahan wajib diisi.',
            ),
            buildListItem(
              title: 'Bagaimana saya bisa memperbarui informasi tentang lahan yang sudah saya tambahkan sebelumnya?',
              answer: 'Anda dapat memperbarui informasi tentang lahan yang sudah Anda tambahkan dengan masuk ke “Daftar Lahan” pada navbar “Lahan”, pilih lahan yang ingin diperbarui, dan klik opsi "Edit" pada icon titik tiga',
            ),
            buildListItem(
              title: 'Bagaimana cara menghapus lahan dari daftar saya jika sudah tidak relevan atau tidak lagi dimiliki?',
              answer: 'Anda dapat memperbarui informasi tentang lahan yang sudah Anda tambahkan dengan masuk ke “Daftar Lahan” pada navbar “Lahan”, pilih lahan yang ingin diperbarui, dan klik opsi "Hapus" pada icon titik tiga',
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