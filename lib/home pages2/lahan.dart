import 'package:flutter/material.dart';

import 'formulir.dart';

void main() {
  runApp(LahanPage());
}

class LahanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Anda Belum mempuyai Lahan! Tambahkan lahan baru ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FormulirPenambahanLahan()),
          );
        },
        child: Icon(Icons.add,
            color: Colors.white), // Mengubah warna ikon menjadi putih
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .endFloat, // Menempatkan tombol di sebelah kanan bawah
    );
  }
}
