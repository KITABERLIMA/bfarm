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
      home: PembayaranPage(), // Menggunakan halaman AkunPenggunaPage sebagai home
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
          title: 'Apa metode pembayaran yang tersedia di aplikasi ini?',
          context: context,
          answer: 'Kartu kredit/debit, bank transfer, virtual account, e-Wallet, retail outlet, internet banking dan mobile banking.', 
        ),
        const SizedBox(height: 16), // Memberikan ruang di antara objek pertama dan kedua
        buildListItem(
          title: 'Apakah ada biaya tambahan yang akan dikenakan untuk metode pembayaran tertentu?',
          context: context,
          answer: 'Biaya tambahan untuk metode pembayaran tertentu dapat bervariasi tergantung pada kebijakan Midtrans dan penyedia layanan pembayaran (bank atau penyedia e-wallet).', 
        ),
        const SizedBox(height: 16), // Memberikan ruang di antara objek kedua dan ketiga
        buildListItem(
          title: 'Apakah ada biaya tambahan yang harus saya bayarkan selain harga produk?',
          context: context,
          answer: 'Ada, untuk produk harga yang tercantum belum termasuk biaya pengiriman dan untuk pemeriksaan lahan belum termasuk biaya akomodasi.', 
        ),
        const SizedBox(height: 16), // Memberikan ruang di antara objek ketiga dan keempat
        buildListItem(
          title: 'Bagaimana saya bisa melihat bukti pembayaran setelah proses pembayaran selesai?',
          context: context,
          answer: 'Anda dapat melihat bukti pembayaran yang telah anda lakukan pada navbar "Histori"',
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
