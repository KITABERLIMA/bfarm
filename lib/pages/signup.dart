import 'package:flutter/material.dart';
import 'kebijakan_privasi.dart';
import 'ketentuan_layanan.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'package:dropdown_search/dropdown_search.dart';
import 'otp.dart';

void main() {
  runApp(MaterialApp(
    home: SignUp(
      apiKey:
          '2ed019ca673ef08cc29666f0af5faa5cc30d16ddb4882770297948bed8e54452',
    ),
  ));
}

// Kelas model untuk menyimpan data provinsi, kota, kabupaten, dll.
class Provinsi {
  final String id;
  final String name;

  Provinsi({required this.id, required this.name});

  factory Provinsi.fromJson(Map<String, dynamic> json) {
    return Provinsi(id: json['id'], name: json['name']);
  }
}

class Kota {
  final String id;
  final String idProvinsi;
  final String name;

  Kota({required this.id, required this.idProvinsi, required this.name});

  factory Kota.fromJson(Map<String, dynamic> json) {
    return Kota(
        id: json['id'], idProvinsi: json['id_provinsi'], name: json['name']);
  }
}

class Kecamatan {
  final String id;
  final String idKabupaten;
  final String name;

  Kecamatan({required this.id, required this.idKabupaten, required this.name});

  factory Kecamatan.fromJson(Map<String, dynamic> json) {
    return Kecamatan(
        id: json['id'], idKabupaten: json['id_kabupaten'], name: json['name']);
  }
}

class Kelurahan {
  final String id;
  final String idKecamatan;
  final String name;

  Kelurahan({required this.id, required this.idKecamatan, required this.name});

  factory Kelurahan.fromJson(Map<String, dynamic> json) {
    return Kelurahan(
        id: json['id'], idKecamatan: json['id_kecamatan'], name: json['name']);
  }
}

class SignUp extends StatefulWidget {
  final String apiKey;
  String idProvinsi = "0";
  String idKabupaten = "0";
  String idKecamatan = "0";
  SignUp({required this.apiKey});
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _fullAddressController = TextEditingController();
  final TextEditingController _provinceController = TextEditingController();
  final TextEditingController _cityDistrictController = TextEditingController();
  final TextEditingController _subDistrictController = TextEditingController();
  final TextEditingController _villageController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();

  String? _userType = "individual";
  File? _selectedImage;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please select an image")),
      );
    }
  }

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      if (_userType == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please select a user type")),
        );
        return;
      }

      if (_selectedImage == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please select a profile picture")),
        );
        return;
      }

      var uri = Uri.parse("http://bfarm.ahmadyaz.my.id/api/individuals");
      //var uri = Uri.parse("192.168.100.170:8000/api/individuals");

      var request = http.MultipartRequest("POST", uri);

      request.fields['user_type'] = _userType!;
      request.fields['first_name'] = _firstNameController.text;
      request.fields['last_name'] = _lastNameController.text;
      request.fields['email'] =
          _emailController.text.trim(); // Hilangkan spasi ekstra
      request.fields['password'] = _passwordController.text;
      request.fields['phone'] = _phoneController.text;
      request.fields['full_address'] = _fullAddressController.text;
      request.fields['province'] = _provinceController.text;
      request.fields['city_district'] = _cityDistrictController.text;
      request.fields['sub_district'] = _subDistrictController.text;
      request.fields['village'] = _villageController.text;
      request.fields['postal_code'] = _postalCodeController.text;

      var imageFile =
          await http.MultipartFile.fromPath('image', _selectedImage!.path);
      request.files.add(imageFile);

      var response = await request.send();
      var responseBody = await response.stream.bytesToString();
      var jsonResponse = jsonDecode(responseBody);

      if (response.statusCode == 200 && jsonResponse['success'] == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Registration successful!")),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  OTPScreen(email: _emailController.text.trim())),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Registration failed: $responseBody")),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill all required fields.")),
      );
      // Optional: Log the response body or handle it in another way if needed
      // print("Form validation failed: $responseBody");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: SingleChildScrollView(
        child: Column(
          key: _formKey,
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
                  hintText: 'Masukkan Kode Pos Anda',
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ElevatedButton(
                onPressed: () {},
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
