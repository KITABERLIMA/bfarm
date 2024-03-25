import 'package:flutter/material.dart';

import 'berhasilperbaruisandi.dart';

void main() {
  runApp(BuatKataSandiBaru());
}

class BuatKataSandiBaru extends StatefulWidget {
  @override
  _BuatKataSandiBaruState createState() => _BuatKataSandiBaruState();
}

class _BuatKataSandiBaruState extends State<BuatKataSandiBaru> {
  bool _obscureText1 = true;
  bool _obscureText2 = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(
                  context); // Navigate back when the back arrow is pressed
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 20),
              children: <Widget>[
                SizedBox(height: 20),
                Text(
                  'Buat Kata Sandi Baru',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Buatlah kata sandi baru. Pastikan berbeda dengan yang sebelumnya untuk keamanan.',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Kata Sandi',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    border: Border.all(color: Colors.green),
                  ),
                  padding: EdgeInsets.only(left: 10),
                  child: TextFormField(
                    obscureText: _obscureText1,
                    decoration: InputDecoration(
                      hintText: 'Masukkan Kata Sandi Baru Anda',
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        icon: _obscureText1
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _obscureText1 = !_obscureText1;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Konfirmasi Kata Sandi',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(height: 10), // Tambahkan jarak di sini
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    border: Border.all(color: Colors.green),
                  ),
                  padding: EdgeInsets.only(left: 10),
                  child: TextFormField(
                    obscureText: _obscureText2,
                    decoration: InputDecoration(
                      hintText: 'Masukkan Kembali Kata Sandi',
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        icon: _obscureText2
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _obscureText2 = !_obscureText2;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BerhasilPerbaruiSandi()),
                      );
                    },
                    child: Text(
                      'Perbarui Kata Sandi',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green),
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
