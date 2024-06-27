import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    home: CaraPembayaranLangganan(),
    debugShowCheckedModeBanner: false, // Disable the debug banner here
  ));
}

class CaraPembayaranLangganan extends StatelessWidget {
  const CaraPembayaranLangganan({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, // Disable the debug banner here as well
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.white,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('Cara Pembayaran'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            const AdditionalContent(),
          ],
        ),
      ),
    );
  }
}

class AdditionalContent extends StatelessWidget {
  const AdditionalContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'BCA Virtual Account',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '1234567890',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w800,
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
          const Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          const SizedBox(height: 16),
          const AccountNumber(),
          const SizedBox(height: 16),
          const TotalPayment(),
          const SizedBox(height: 16),
          const CaraBayar(),
        ],
      ),
    );
  }
}

class AccountNumber extends StatelessWidget {
  const AccountNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
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
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '8077702468494411885',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
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
                    fontSize: 14,
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
  const TotalPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Total Pembayaran',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Rp. 265.000',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Clipboard.setData(
                    ClipboardData(text: 'Rp. 265.000'),
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
                        fontSize: 14,
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
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          height: 1,
          color: Colors.grey,
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
      padding: const EdgeInsets.symmetric(vertical: 8),
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
    );
  }

  Widget buildListItem({
    required String title,
    required String answer,
  }) {
    return ExpansionTile(
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold,
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
          padding: const EdgeInsets.all(8.0),
          child: Text(
            answer,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}
