import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const CaraPembayaran(totalAmount: 0));
}

class CaraPembayaran extends StatelessWidget {
  final int totalAmount;

  const CaraPembayaran({Key? key, required this.totalAmount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor:
            Colors.white, // Ubah warna latar belakang scaffold
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context); // Kembali ke halaman sebelumnya
            },
          ),
          title: const Text(
            'Cara Pembayaran',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: ListView(
          children: [
            AdditionalContent(totalAmount: totalAmount),
          ],
        ),
      ),
    );
  }
}

class AdditionalContent extends StatelessWidget {
  final int totalAmount;
  const AdditionalContent({Key? key, required this.totalAmount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 35),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'BCA Virtual Account', // Teks Akun Virtual BCA
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '1234567890', // Nomor Akun Virtual
                    style: TextStyle(
                      color: Color(0xFF0A0A0A),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              Spacer(), // Spacer untuk menjaga jarak antara teks dan gambar
              Image.asset(
                "assets/images/Bank.png", // Gambar BCA (disesuaikan dengan nama dan path gambar yang benar)
                width: 40,
                height: 40,
              ),
            ],
          ),
          Divider(
            // Garis pemisah modern
            thickness: 1, // Ketebalan garis
            color: Colors.grey.withOpacity(0.5), // Warna garis dengan opacity
          ),
          const AccountNumber(),
          TotalPayment(totalAmount: totalAmount),
          const CaraBayar()
        ],
      ),
    );
  }
}

class AccountNumber extends StatelessWidget {
  const AccountNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 0), // Sesuaikan padding vertikal dan horizontal
      child: Container(
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
      ),
    );
  }
}

class TotalPayment extends StatelessWidget {
  final int totalAmount;
  const TotalPayment({Key? key, required this.totalAmount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    ' Total Pembayaran',
                    style: TextStyle(
                      color: Color(0xFF616161),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Rp. $totalAmount',
                    style: const TextStyle(
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
                    ClipboardData(text: 'Rp. $totalAmount'),
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
        ),
        const SizedBox(height: 8), // Tambahkan spasi vertikal
        Container(
          width: double.infinity,
          height: 1, // Atur ketebalan garis
          color: Colors.grey.withOpacity(0.5), // Warna garis dengan opacity
        ),
      ],
    );
  }
}

class CaraBayar extends StatefulWidget {
  const CaraBayar({Key? key}) : super(key: key);

  @override
  _CaraBayarState createState() => _CaraBayarState();
}

class _CaraBayarState extends State<CaraBayar> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildListItem(
              title: 'ATM BCA',
              answer: '1. Masukkan Kartu ATM dan PIN\n'
                  '2. Pilih menu bayar/beli\n'
                  '3. Pilih menu "Lainnya" hingga menemukan menu "Multipayment"\n'
                  '4. Masukkan Kode Biller Tokopedia (88708), lalu pilih Benar\n'
                  '5. Masukkan "Nomor Virtual Account" Tokopedia, lalu pilih tombol Benar\n'
                  '6. Masukkan Angka "1" untuk memilih tagihan, lalu pilih tombol Ya\n'
                  '7. Akan muncul konfirmasi pembayaran, lalu pilih tombol Ya\n'
                  '8. Simpan struk sebagai bukti pembayaran Anda',
            ),
            buildListItem(
              title: 'm-BCA (BCA mobile)',
              answer: '1. Buka BCA Mobile\n'
                  '2. Pilih menu m-Transfer\n'
                  '3. Pilih menu BCA Virtual Account\n'
                  '4. Masukkan nomor BCA Virtual Account dan Klik Send\n'
                  '5. Cek nominal yang muncul\n'
                  '6. Masukkan PIN m-BCA\n'
                  '7. Transaksi Berhasil',
            ),
            buildListItem(
              title: 'Internet Banking BCA',
              answer: '1. Masuk ke Akun BCA Internet Banking\n'
                  '2. Pilih Jenis Transaksi\n'
                  '3. Masukkan Data Transaksi\n'
                  '4. Konfirmasi Transaksi',
            ),
            buildListItem(
              title: 'Kantor Bank BCA',
              answer: '1. Datang ke cabang Bank BCA terdekat\n'
                  '2. Ambil antrian\n'
                  '3. Mengisi formulir transfer\n'
                  '4. Menunggu Panggilan Antrian\n'
                  '5. Menyerahkan formulir transfer ke Teller\n'
                  '6. Teller akan memproses transfer dan memberikan bukti pembayaran\n'
                  '7. Transaksi Berhasil',
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
    return ExpansionTile(
      title: Padding(
        padding: const EdgeInsetsDirectional.only(start: 0),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      trailing: Icon(
        _isExpanded ? Icons.expand_less : Icons.expand_more,
        color: Colors.black,
      ),
      onExpansionChanged: (bool expanded) {
        setState(() {
          _isExpanded = expanded;
        });
      },
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(
              start: 16), // Tambahkan padding responsif
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Atur crossAxisAlignment
            children: [
              const SizedBox(width: double.infinity), // Spasi di sisi kanan
              Padding(
                padding: const EdgeInsets.only(
                    right: 16), // Tambahkan padding di sisi kanan
                child: Text(
                  answer,
                  style: const TextStyle(
                    color: Colors.black,
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
    );
  }
}
