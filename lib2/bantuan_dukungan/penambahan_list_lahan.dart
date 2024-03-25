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

class Group12860 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildListItem(
          title: 'Bagaimana cara menambahkan lahan baru ke dalam daftar saya?',
          context: context,
          answer: 'Untuk menambahkan lahan baru, Anda dapat masuk ke akun Anda, pilih navbar "Lahan" lalu klik button tambah dan ikuti langkah-langkah yang disediakan untuk memasukkan informasi tentang lahan tersebut.', 
        ),
        const SizedBox(height: 16), // Memberikan ruang di antara objek pertama dan kedua
        buildListItem(
          title: 'Apakah ada batasan jumlah lahan yang dapat saya tambahkan ke dalam daftar saya?',
          context: context,
          answer: 'Secara umum, tidak ada batasan jumlah lahan yang dapat Anda tambahkan ke dalam daftar Anda, namun tergantung pada kebijakan dan kapasitas penyimpanan aplikasi.', 
        ),
        const SizedBox(height: 16), // Memberikan ruang di antara objek kedua dan ketiga
        buildListItem(
          title: 'Apa langkah-langkah yang harus saya ikuti untuk mengunggah informasi lahan dengan benar?',
          context: context,
          answer: 'Langkah-langkahnya meliputi masuk ke menu Lahan, klik button tambah, masukkan detail yang diminta seperti lokasi, luas, dan informasi lainnya, dan simpan informasi yang dimasukkan.', 
        ),
        const SizedBox(height: 16), // Memberikan ruang di antara objek ketiga dan keempat
        buildListItem(
          title: 'Apakah saya perlu memasukkan semua detail tentang lahan atau ada informasi yang opsional?',
          context: context,
          answer: 'Semua informasi yang ada di form untuk penambahan list lahan wajib diisi.',
        ),
        const SizedBox(height: 16), 
        buildListItem(
          title: 'Bagaimana saya bisa memperbarui informasi tentang lahan yang sudah saya tambahkan sebelumnya?',
          context: context,
          answer: 'Anda dapat memperbarui informasi tentang lahan yang sudah Anda tambahkan dengan masuk ke “Daftar Lahan” pada navbar “Lahan”, pilih lahan yang ingin diperbarui, dan klik opsi "Edit" pada icon titik tiga',
        ),
        const SizedBox(height: 16), 
        buildListItem(
          title: 'Bagaimana cara menghapus lahan dari daftar saya jika sudah tidak relevan atau tidak lagi dimiliki?',
          context: context,
          answer: 'Anda dapat memperbarui informasi tentang lahan yang sudah Anda tambahkan dengan masuk ke “Daftar Lahan” pada navbar “Lahan”, pilih lahan yang ingin diperbarui, dan klik opsi "Hapus" pada icon titik tiga',
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
