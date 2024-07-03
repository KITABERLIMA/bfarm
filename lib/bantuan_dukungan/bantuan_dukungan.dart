import 'package:flutter/material.dart';
import 'akun_pengguna.dart';
import 'penambahan_list_lahan.dart';
import 'pengajuan_list_lahan.dart';
import 'pembelian_produk.dart';
import 'pembayaran.dart';

void main() {
  runApp(BantuanDukungan());
}

class BantuanDukungan extends StatefulWidget {
  @override
  _BantuanDukungan createState() => _BantuanDukungan();
}

class _BantuanDukungan extends State<BantuanDukungan> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFF7F7F7),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context); // Aksi ketika tombol diklik
            },
          ),
          title: Text(
            'Bantuan dan Dukungan',
            style: TextStyle(
              color: Color(0xFF121212),
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Group12859(),
                    SizedBox(height: 16),
                    HaloBagaimanaKamiBisaMembantuAnda(),
                    SizedBox(height: 16),
                    Group12860(),
                    TidakMenemukanJawabannya(),
                    AndaBelumMenemukanJawaban(),
                    Vector(),
                    SizedBox(
                        height: 100), // Membuat ruang di bawah agar scrollable
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Group12859 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Image.asset('assets/images/bantuan dukungan.png'),
    );
  }
}

class HaloBagaimanaKamiBisaMembantuAnda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(6.0),
      child: Text(
        'Halo, Bagaimana kami bisa membantu Anda?',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
          height: 1.5,
          letterSpacing: 0.5,
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
        SizedBox(height: 10), // Memberikan ruang di atas objek pertama
        buildListItem(
          title: 'Akun Pengguna',
          context: context,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AkunPenggunaPage()),
            );
          },
        ),
        SizedBox(
            height: 16), // Memberikan ruang di antara objek pertama dan kedua
        buildListItem(
          title: 'Penambahan List Lahan',
          context: context,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PenambahanListLahanPage()),
            );
          },
        ),
        SizedBox(
            height: 16), // Memberikan ruang di antara objek kedua dan ketiga
        buildListItem(
          title: 'Pengajuan List Lahan',
          context: context,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PengajuanListLahanPage()),
            );
          },
        ),
        SizedBox(
            height: 16), // Memberikan ruang di antara objek ketiga dan keempat
        buildListItem(
          title: 'Pembelian Produk',
          context: context,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PembelianProdukPage()),
            );
          },
        ),
        SizedBox(
            height: 16), // Memberikan ruang di antara objek keempat dan kelima
        buildListItem(
          title: 'Pembayaran',
          context: context,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PembayaranPage()),
            );
          },
        ),
      ],
    );
  }

  Widget buildListItem(
      {required String title,
      required BuildContext context,
      VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 51,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x0F000000),
                      blurRadius: 44,
                      offset: const Offset(0, 4),
                      spreadRadius: 0,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 18,
              top: 16,
              child: SizedBox(
                width: MediaQuery.of(context).size.width -
                    90, // Lebar teks agar fleksibel
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF181D27),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 16,
              top: 16,
              child: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF6EBF45),
                ),
                child: const Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TidakMenemukanJawabannya extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 35), // Memberikan ruang di atas teks
        Padding(
          padding: const EdgeInsets.only(left: 40), // Menggeser teks ke kiri
          child: SizedBox(
            width: double.infinity,
            child: Text(
              'Tidak menemukan jawabannya?',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                height: 1.5, // Sesuaikan dengan kebutuhan Anda
                letterSpacing: 0.32,
              ),
            ),
          ),
        ),
        SizedBox(height: 20), // Memberikan ruang di bawah teks
      ],
    );
  }
}

class AndaBelumMenemukanJawaban extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Flexible(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text:
                        'Anda belum menemukan jawaban dari pertanyaan Anda? Tenang, Anda dapat menghubungi kontak di bawah ini setiap hari ',
                    style: TextStyle(
                      color: Color(0xFF676663),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 1.2, // Sesuaikan dengan kebutuhan Anda
                      letterSpacing: 0.32,
                    ),
                  ),
                  TextSpan(
                    text: 'Senin - Jumat',
                    style: TextStyle(
                      color: Color(0xFF676663),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      height: 1.2, // Sesuaikan dengan kebutuhan Anda
                      letterSpacing: 0.32,
                    ),
                  ),
                  TextSpan(
                    text: ' pada jam ',
                    style: TextStyle(
                      color: Color(0xFF676663),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 1.2, // Sesuaikan dengan kebutuhan Anda
                      letterSpacing: 0.32,
                    ),
                  ),
                  TextSpan(
                    text: '09.00 -  16.00',
                    style: TextStyle(
                      color: Color(0xFF676663),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      height: 1.2, // Sesuaikan dengan kebutuhan Anda
                      letterSpacing: 0.32,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.justify, // Mengatur teks menjadi rata kiri
            ),
          ),
        ),
        SizedBox(height: 20), // Memberikan ruang di bawah teks
      ],
    );
  }
}

class Vector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            children: [
              Icon(
                Icons.phone,
                color: Colors.black,
              ),
              SizedBox(width: 25),
              Text(
                '031 848 3355 / 0811 328 1900',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                  letterSpacing: 0.32,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            children: [
              Icon(
                Icons.email,
                color: Colors.black,
              ),
              SizedBox(width: 25),
              Text(
                'sales@ebp.co.id',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                  letterSpacing: 0.32,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
