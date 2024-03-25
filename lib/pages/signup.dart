import 'package:flutter/material.dart';
import 'kebijakan_privasi.dart';
import 'ketentuan_layanan.dart';
import 'otp.dart';

void main() {
  runApp(MaterialApp(
    home: SignUp(),
  ));
}

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final List<String> provinces = [
    'Province 1',
    'Province 2',
    'Province 3',
    'Province 4',
    'Province 5',
    'Province 6',
    'Province 7',
  ];

  String selectedProvince = 'Province 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/sawah.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Pendaftaran',
                      style: TextStyle(
                        fontSize: 32,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Akun personal',
                      style: TextStyle(
                        fontSize: 32,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'Isi seluruh form di bawah untuk mendaftarkan akun',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: Colors.green),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextFormField(
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  hintText: 'Masukkan Nama Depan Anda',
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: Colors.green),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextFormField(
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  hintText: 'Masukkan nama belakang Anda',
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: Colors.green),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextFormField(
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  hintText: 'Masukkan Email Anda',
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: Colors.green),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextFormField(
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  hintText: 'Masukkan Kata Sandi Anda',
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: Colors.green),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextFormField(
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  hintText: 'Masukkan Nomor Telepon',
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: Colors.green),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  hintText: 'Pilih Provinsi Anda',
                  border: InputBorder.none,
                ),
                value: selectedProvince,
                onChanged: (newValue) {
                  setState(() {
                    selectedProvince = newValue!;
                  });
                },
                items: provinces.map((province) {
                  return DropdownMenuItem(
                    value: province,
                    child: Text(province),
                  );
                }).toList(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Silahkan Pilih Provinsi Anda';
                  }
                  return null;
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: Colors.green),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  hintText: 'Pilih Kota Anda',
                  border: InputBorder.none,
                ),
                value: selectedProvince,
                onChanged: (newValue) {
                  setState(() {
                    selectedProvince = newValue!;
                  });
                },
                items: provinces.map((province) {
                  return DropdownMenuItem(
                    value: province,
                    child: Text(province),
                  );
                }).toList(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Silahkan Pilih Kota Anda';
                  }
                  return null;
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: Colors.green),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  hintText: 'Pilih Kecamatan Anda',
                  border: InputBorder.none,
                ),
                value: selectedProvince,
                onChanged: (newValue) {
                  setState(() {
                    selectedProvince = newValue!;
                  });
                },
                items: provinces.map((province) {
                  return DropdownMenuItem(
                    value: province,
                    child: Text(province),
                  );
                }).toList(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Silahkan Pilih Kecamatan Anda';
                  }
                  return null;
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: Colors.green),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  hintText: 'Pilih Kelurahan Anda',
                  border: InputBorder.none,
                ),
                value: selectedProvince,
                onChanged: (newValue) {
                  setState(() {
                    selectedProvince = newValue!;
                  });
                },
                items: provinces.map((province) {
                  return DropdownMenuItem(
                    value: province,
                    child: Text(province),
                  );
                }).toList(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Silahkan Pilih Kelurahan Anda';
                  }
                  return null;
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: Colors.green),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextFormField(
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  hintText: 'Masukkan Kode Pos Anda',
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ElevatedButton(
                onPressed: () {
                  // Handle "Daftar" button press
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OTPScreen(),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: Center(
                    child: Text(
                      'Daftar',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 249, 249, 249),
                      ),
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Dengan masuk atau daftar, Anda setuju dengan',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => KetentuanLayananScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Ketentuan Layanan',
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.green,
                    ),
                  ),
                ),
                Text(
                  ' dan ',
                  style: TextStyle(
                    fontSize: 10.0,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => KebijakanPrivasiScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Kebijakan Privasi',
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.green,
                    ),
                  ),
                ),
                Text(
                  ' bFarm',
                  style: TextStyle(
                    fontSize: 10.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
