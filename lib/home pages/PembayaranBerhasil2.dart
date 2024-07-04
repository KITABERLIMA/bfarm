import 'deskripsi.dart';
import 'package:flutter/material.dart';
import 'langganan.dart';

class PembayaranBerhasil2 extends StatelessWidget {
  const PembayaranBerhasil2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
      ),
      backgroundColor: Colors.white, // Set background color to white
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
                20.0, 0.0, 20.0, 20.0), // Kurangi padding di bagian atas
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/berhasil.png', // Pastikan path ini benar
                  height: 200,
                  width: 200,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Berhasil',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Selamat! Pembayaran anda berhasil dilakukan!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Deskripsi()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 24),
                    backgroundColor: const Color(0xFF6EBF45),
                  ),
                  child: const Text(
                    'Kembali',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
