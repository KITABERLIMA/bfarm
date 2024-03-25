import 'package:flutter/material.dart';

class FormulirPenambahanLahan extends StatefulWidget {
  @override
  _FormulirPenambahanLahanState createState() =>
      _FormulirPenambahanLahanState();
}

class _FormulirPenambahanLahanState extends State<FormulirPenambahanLahan> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // Tambahkan controller dan variabel lainnya sesuai kebutuhan

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulir Penambahan Lahan'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Pemilik Lahan',
                hintText: 'Isikan nama pemilik lahan',
              ),
              // Validator dan controller sesuai kebutuhan
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Luas Lahan',
                hintText: 'Isikan luas lahan per Hektar (Ha)',
              ),
              // Validator dan controller sesuai kebutuhan
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Lokasi',
                hintText: 'Isikan desa/kota/kecamatan/kabupaten',
              ),
              // Validator dan controller sesuai kebutuhan
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Titik Koordinat Lokasi',
                hintText: 'Contoh: (-7.68599, 111.3829)',
              ),
              // Validator dan controller sesuai kebutuhan
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Deskripsi Penggunaan Lahan',
                hintText: 'Masukkan deskripsi penggunaan lahan',
              ),
              // Validator dan controller sesuai kebutuhan
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Aksi ketika tombol ditekan
              },
              child: Text('Unggah Gambar Lahan'),
            ),
            // Tambahkan elemen lain jika diperlukan
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: FormulirPenambahanLahan()));
}
