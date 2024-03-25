import 'package:flutter/material.dart';

class LisensiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bFARM',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pemberian Lisensi bFarm'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          Text(
            'Dengan ini, kami, PT. Lima Benua Koneksindo, memberikan lisensi kepada bFarm untuk menggunakan aplikasi kami dalam pemeriksaan kondisi lahan. Lisensi ini diberikan dengan syarat-syarat berikut:',
            style: TextStyle(
              fontSize: 16.0,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: Colors.black, // Change text color to black
            ),
          ),
          SizedBox(height: 16.0),
          ListTile(
            leading: Container(
              width: 30.0,
            ),
            title: RichText(
              text: TextSpan(
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black), // Change text color to black
                children: [
                  TextSpan(
                    text: '1. Penggunaan Aplikasi :',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text:
                        'Lisensi ini hanya berlaku untuk penggunaan aplikasi yang disebutkan di atas dalam konteks pemeriksaan kondisi lahan yang sah dan tidak boleh digunakan untuk tujuan lain tanpa izin tertulis dari pemilik lisensi.',
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Container(
              width: 30.0,
            ),
            title: RichText(
              text: TextSpan(
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black), // Change text color to black
                children: [
                  TextSpan(
                    text: '2. Kepemilikan Aplikasi :',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text:
                        'Aplikasi yang digunakan tetap menjadi milik [Nama Perusahaan/Individu] dan pengguna hanya diberikan hak penggunaan yang terbatas sebagaimana diatur dalam lisensi ini.',
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Container(
              width: 30.0,
            ),
            title: RichText(
              text: TextSpan(
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black), // Change text color to black
                children: [
                  TextSpan(
                    text: '3. Perlindungan Hak Cipta : ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text:
                        'Pengguna diwajibkan untuk menghormati dan melindungi hak cipta dari aplikasi ini. Tidak diperbolehkan melakukan reproduksi, distribusi, atau modifikasi tanpa izin tertulis dari pemilik hak cipta.',
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Container(
              width: 30.0,
            ),
            title: RichText(
              text: TextSpan(
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black), // Change text color to black
                children: [
                  TextSpan(
                    text: '4. Tanggung Jawab Pengguna :',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text:
                        'Pengguna bertanggung jawab sepenuhnya atas penggunaan aplikasi ini. [Nama Perusahaan/Individu] tidak bertanggung jawab atas kerusakan atau kerugian yang disebabkan oleh penggunaan yang tidak tepat atau salah dari aplikasi.',
                  ),
                ],
              ),
            ),
          ),
          ListTile(
              leading: Container(
                width: 30.0,
              ),
              title: RichText(
                text: TextSpan(
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black), // Change text color to black
                  children: [
                    TextSpan(
                      text: '5. Perubahan dan Pembatalan : ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text:
                          '[Nama Perusahaan/Individu] berhak untuk mengubah atau membatalkan lisensi ini sewaktu-waktu tanpa pemberitahuan terlebih dahulu jika diperlukan.',
                    ),
                  ],
                ),
              )),
          ListTile(
            leading: Container(
              width: 30.0,
            ),
            title: RichText(
              text: TextSpan(
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black), // Change text color to black
                children: [
                  TextSpan(
                    text:
                        'Dengan menandatangani ini, pengguna setuju untuk mematuhi semua syarat dan ketentuan yang tercantum dalam lisensi ini.',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                  TextSpan(
                    text: '[Tempat dan Tanggal]'
                        '\n[Nama dan Tanda Tangan Pengguna/Aplikasi]'
                        '[Nama dan Tanda Tangan Pemilik Lisensi]'
                        '\n',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(LisensiScreen());
}
