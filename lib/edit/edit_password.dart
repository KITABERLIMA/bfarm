import 'package:flutter/material.dart';

class EditPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ubah Kata Sandi'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 16),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: Color(0xFF6EBF45),
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    'api',
                  ),
                  radius: 30.0,
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jennie Aldebaran',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Personal',
                      style: TextStyle(
                        color: Color(0xFFD7D7D7),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 1.2,
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Classic',
                        style: TextStyle(
                          color: Color(0xFF6EBF45),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 1.2,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Email',
            style: TextStyle(
              color: Color(0xFF181D27),
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 5),
          Container(
            height: 40,
            decoration: ShapeDecoration(
              color: Color(0xFFF4F4F4),
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Color(0xFF6EBF45)),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'No Telepon',
            style: TextStyle(
              color: Color(0xFF181D27),
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 5),
          Container(
            height: 40,
            decoration: ShapeDecoration(
              color: Color(0xFFF4F4F4),
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Color(0xFF6EBF45)),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Kata Sandi ',
            style: TextStyle(
              color: Color(0xFF181D27),
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 5),
          Container(
            height: 40,
            decoration: ShapeDecoration(
              color: Color(0xFFF4F4F4),
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Color(0xFF6EBF45)),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Tambahkan logika untuk tombol "Perbarui" di sini
            },
            child: Text(
              'Perbarui',
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  Color(0xFF6EBF45), // Mengatur warna latar belakang tombol
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class EditPasswordApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bFARM',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: EditPassword(),
    );
  }
}

void main() {
  runApp(EditPasswordApp());
}
