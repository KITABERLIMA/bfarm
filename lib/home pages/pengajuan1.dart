import 'package:bfarm_mobileapp/home%20pages/Dashboard.dart';
import 'package:bfarm_mobileapp/home%20pages/deskripsi.dart';
import 'package:bfarm_mobileapp/home%20pages/deskripsibelumterpetakan.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Pengajuan1());
}

class Pengajuan1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pengajuan Lahan',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Pengajuan Lahan',
            style:
                TextStyle(color: Colors.white), // Menambahkan warna teks putih
          ),
          backgroundColor: Colors.green, // Menambahkan backgroundColor hijau
        ),
        body: PengajuanMandiriForm(),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.green),
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Dashboard(),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  child: Text(
                    'Batal',
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Container(
                width: MediaQuery.of(context).size.width * 0.45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.green,
                ),
                child: TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Berhasil'),
                          content: Text('Pengajuan berhasil diajukan.'),
                          actions: <Widget>[
                            TextButton(
                              child: Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        Deskripsi2(), // Navigate to Deskripsi page
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  child: Text(
                    'Ajukan',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PengajuanMandiriForm extends StatefulWidget {
  @override
  _PengajuanMandiriFormState createState() => _PengajuanMandiriFormState();
}

class _PengajuanMandiriFormState extends State<PengajuanMandiriForm> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Image.asset('assets/images/tanah.png'),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '42 966 Ha, Kalimantan',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                SizedBox(height: 16),
                Text(
                  'Supardi',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      'Terpetakan: ',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '12/02/2024',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Divider(color: Colors.grey), // Garis horizontal abu-abu
                SizedBox(height: 16),
                Text(
                  'Detail Harga',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Subtotal', style: TextStyle(fontSize: 16)),
                    Text(
                      'Rp 5.000.000',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Biaya Layanan', style: TextStyle(fontSize: 16)),
                    Text(
                      'Rp 5.000',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Harga Total', style: TextStyle(fontSize: 16)),
                    Text(
                      'Rp 5.005.000',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '*',
                      style: TextStyle(color: Colors.red),
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Note: ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  'Harga tersebut belum Termasuk Akomodasi & Informasi Selanjutnya akan dikonfirmasikan admin melalui whatsapp',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
