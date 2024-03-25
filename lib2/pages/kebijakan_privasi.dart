import 'package:flutter/material.dart';

class KebijakanPrivasiScreen extends StatelessWidget {
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
        title: Text('Kebijakan Privasi'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          Text(
            'Selamat datang di Aplikasi bFarm. Aplikasi ini dibuat dengan tujuan untuk membantu pengguna dalam memantau kondisi lahan mereka dengan lebih efisien dan efektif. Kebijakan privasi ini menjelaskan bagaimana kami mengumpulkan, menggunakan, dan melindungi informasi yang dikumpulkan dari pengguna aplikasi ini.',
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
                    text: '1. Ketersediaan Layanan : ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text:
                        'Aplikasi ini disediakan "sebagaimana adanya" dan "sebagaimana tersedia". Kami tidak menjamin ketersediaan atau kelancaran Aplikasi, dan kami dapat menghentikan, membatasi, atau mengubah Aplikasi kapan saja tanpa pemberitahuan sebelumnya.',
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
                    text: '2. Penggunaan Apliksi : ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text:
                        'Anda bertanggung jawab atas penggunaan Aplikasi ini dan setuju untuk tidak menggunakan Aplikasi untuk tujuan yang melanggar hukum atau melanggar hak-hak pihak lain. Anda juga setuju untuk tidak menggunakan Aplikasi secara mengganggu atau merusak, atau mengganggu kinerja normal Aplikasi.',
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
                    text: '3. Kebijakan Privasi : ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text:
                        'Dengan menggunakan Aplikasi ini, Anda setuju dengan Kebijakan Privasi kami yang menjelaskan bagaimana kami mengumpulkan, menggunakan, dan melindungi informasi pribadi Anda. Mohon baca Kebijakan Privasi dengan cermat sebelum menggunakan Aplikasi.',
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
                    text: '4. Ketentuan Tambahan : ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text:
                        'Dari waktu ke waktu, kami dapat menambahkan ketentuan tambahan yang berlaku untuk penggunaan Aplikasi ini. Ketentuan tambahan tersebut akan diumumkan di Aplikasi dan dianggap menjadi bagian dari syarat dan ketentuan ini.',
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
                    text: '5. Perubahan Syarat dan Ketentuan : ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text:
                        ' Kami dapat mengubah syarat dan ketentuan ini kapan saja dengan atau tanpa pemberitahuan sebelumnya. Perubahan tersebut akan mulai berlaku pada tanggal publikasi. Penggunaan terus-menerus Aplikasi setelah perubahan tersebut dianggap sebagai penerimaan Anda atas perubahan tersebut.',
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
  runApp(KebijakanPrivasiScreen());
}
