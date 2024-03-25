import 'package:flutter/material.dart';

import 'signup_personal.dart';

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
        body: Center(
          child: Stack(
            // Mengubah Column menjadi Stack
            children: [
              Positioned(
                top: 5,
                left: 5,
                child: ClipRRect(
                  child: Image.asset(
                    'assets/images/5.png',
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
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
                          builder: (context) => SignUpPage(),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 50),
                  buildOption(
                    'assets/images/9.png',
                    'assets/images/10.png',
                    'Perusahaan',
                    () {},
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
}
