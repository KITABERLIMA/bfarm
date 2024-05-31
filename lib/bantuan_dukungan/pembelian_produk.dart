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
          PembelianProdukPage(), // Menggunakan halaman AkunPenggunaPage sebagai home
    );
  }
}

class PembelianProdukPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        title: Text(
          'Pembelian Produk',
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

class Group12860 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildListItem(
          title: 'Bagaimana cara melakukan pembelian produk di aplikasi ini?',
          context: context,
          answer:
              'Anda dapat melakukan pembelian produk dengan masuk beranda lalu gulir ke bawah sampai menemukan produk lalu tekan tombol "Beli" . Setelah itu, ikuti langkah-langkah pembayaran yang disediakan.',
        ),
        const SizedBox(
            height: 16), // Memberikan ruang di antara objek pertama dan kedua
        buildListItem(
          title:
              'Apakah ada batasan jumlah produk yang dapat dibeli dalam satu transaksi?',
          context: context,
          answer:
              'Batasan jumlah produk yang dapat dibeli dalam satu transaksi tergantung pada ketersediaan stok.',
        ),
        const SizedBox(
            height: 16), // Memberikan ruang di antara objek kedua dan ketiga
        buildListItem(
          title:
              'Bagaimana cara memeriksa ketersediaan stok produk sebelum melakukan pembelian?',
          context: context,
          answer:
              'Stok produk yang tersedia dapat dilihat saat kita telah menambahkan barang di “Keranjang”.',
        ),
        const SizedBox(
            height: 16), // Memberikan ruang di antara objek ketiga dan keempat
        buildListItem(
          title:
              'Apakah ada biaya tambahan yang harus saya bayarkan selain harga produk?',
          context: context,
          answer:
              'Biaya tambahan seperti biaya pengiriman, pajak, biaya layanan mungkin dikenakan tergantung pada lokasi pengiriman.',
        ),
        const SizedBox(height: 16),
        buildListItem(
          title:
              'Apakah tersedia metode pembayaran yang berbeda? Jika ya, apa saja metode pembayaran yang dapat digunakan?',
          context: context,
          answer:
              'Berbagai metode pembayaran  tersedia, seperti kartu kredit, transfer bank, e-wallet, atau pembayaran tunai saat pengiriman.',
        ),
        const SizedBox(height: 16),
        buildListItem(
          title:
              'Bagaimana saya bisa mendapatkan bantuan jika mengalami masalah atau kesulitan saat mengajukan daftar lahan?',
          context: context,
          answer:
              'Jika Anda mengalami masalah atau kesulitan, Anda dapat menghubungi tim bFarm melalui saluran komunikasi yang disediakan, seperti email atau whatsapp. Tim bFarm akan siap membantu Anda menyelesaikan masalah tersebut.',
        ),
      ],
    );
  }

  Widget buildListItem(
      {required String title, required BuildContext context, String? answer}) {
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
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 4,
                      offset: Offset(0, 2))
                ], // Bayangan
                border: Border.all(
                    color: const Color(0xFF6EBF45), width: 1), // Garis batas
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                answer,
                style: TextStyle(
                  color: Colors.black, // Warna teks hitam
                  fontSize: 12,
                ),
                textAlign:
                    TextAlign.justify, // Menjaga teks jawaban menjadi rapih
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
