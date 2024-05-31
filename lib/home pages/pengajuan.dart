import 'package:flutter/material.dart';

void main() {
  runApp(Pengajuan());
}

class Pengajuan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pengajuan Lahan',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pengajuan Lahan'),
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
                        builder: (context) => Pengajuan(),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Pengajuan(),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  child: Text(
                    'Bayar',
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
                Text(
                  '*Note: Harga tersebut belum Termasuk Akomodasi & Informasi Selanjutnya akan dikonfirmasikan admin melalui whatsapp',
                  style: TextStyle(color: Colors.red),
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
