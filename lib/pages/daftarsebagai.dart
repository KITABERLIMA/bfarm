import 'package:flutter/material.dart';

import '../pembayaran/pembayaran_berhasil.dart';
import 'signup_personal1.dart';
//import 'signup_personal.dart';

void main() {
  runApp(const DaftarSebagai());
}

class DaftarSebagai extends StatelessWidget {
  const DaftarSebagai({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white, // Warna latar belakang AppBar
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black), // Tombol Back
            onPressed: () {
              Navigator.pop(context); // Kembali ke halaman sebelumnya
            },
          ),

          elevation: 0, // Menghilangkan bayangan AppBar
        ),
        body: Center(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Daftar Sebagai?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF6EBF45),
                      fontSize: 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 50),
                  buildOption(
                    'assets/images/7.png',
                    'assets/images/8.png',
                    'Personal',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterForm(
                                  apiKey:
                                      '2ed019ca673ef08cc29666f0af5faa5cc30d16ddb4882770297948bed8e54452',
                                )),
                      );
                    },
                  ),
                  SizedBox(height: 50),
                  buildOption(
                    'assets/images/9.png',
                    'assets/images/10.png',
                    'Perusahaan',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PembayaranBerhasil(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildOption(
    String backgroundImagePath,
    String overlayImagePath,
    String buttonText,
    void Function() onPressed,
  ) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 330,
          height: 239,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(backgroundImagePath),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        Positioned(
          top: 40,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            width: 284,
            height: 164,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(overlayImagePath),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        Positioned(
          top: 190,
          child: Column(
            children: [
              ElevatedButton(
                onPressed: onPressed,
                child: Text(
                  buttonText,
                  style: TextStyle(color: Colors.white), // Warna teks putih
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xCC6EBF45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  ConcreteRegisterForm() {}
}
