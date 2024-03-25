import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:dropdown_search/dropdown_search.dart';

import '../model/provinsi.dart';
import '../model/kota.dart';
import '../model/kecamatan.dart';
import '../model/kelurahan.dart';
import 'otp.dart';

void main() {
  runApp(MaterialApp(
    home: SignUpPage(),
  ));
}

// ignore: must_be_immutable
class SignUpPage extends StatefulWidget {
  String idProvinsi = "0";
  String idKabupaten = "0";
  String idKecamatan = "0";

  final String apiKey =
      "2ed019ca673ef08cc29666f0af5faa5cc30d16ddb4882770297948bed8e54452";

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _userTypeController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _fullAddressController = TextEditingController();
  final _subsDistrictController = TextEditingController();
  final _villageController = TextEditingController();
  final _postalCodeController = TextEditingController();
  final _cityDistrictController = TextEditingController();
  final _provinceController = TextEditingController();
  PickedFile? _image;

  Future<String?> uploadImageAndGetUrl(PickedFile image) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'http://192.168.100.170:8000/api/upload_image'), // Ganti URL dengan URL upload gambar di server Anda
      );

      String filePath = image.path;
      var file = await http.MultipartFile.fromPath('image', filePath);
      request.files.add(file);

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        return json.decode(response.body)['image_url'];
      } else {
        print('Failed to upload image. Status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }

  Future<void> _register() async {
    String userType = _userTypeController.text;
    String firstName = _firstNameController.text;
    String lastName = _lastNameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    String phone = _phoneController.text;
    String fullAddress = _fullAddressController.text;
    String subDistrict = _subsDistrictController.text;
    String village = _villageController.text;
    String postalCode = _postalCodeController.text;
    String cityDistrict = _cityDistrictController.text;
    String province = _provinceController.text;

    String? image;
    if (_image != null) {
      image = await uploadImageAndGetUrl(_image!);
    }

    Map<String, dynamic> data = {
      'user_type': userType,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'password': password,
      'phone': phone,
      'full_address': fullAddress,
      'sub_district': subDistrict,
      'village': village,
      'postal_code': postalCode,
      'city_district': cityDistrict,
      'province': province,
      'image': image,
    };

    String jsonData = json.encode(data);

    var response = await http.post(
      Uri.parse('http://192.168.100.170:8000/api/individuals'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonData,
    );

    if (response.statusCode == 200) {
      print('Registration successful');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OTPScreen()),
      );
    } else {
      print('Registration failed');
      // Tampilkan pesan kesalahan jika diperlukan
    }
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedFile;
    });
  }

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
                controller: _firstNameController,
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
                controller: _lastNameController,
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  hintText: 'Masukkan Nama Belakang Anda',
                  border: InputBorder.none,
                ),
              ),
            ),
            // other text form fields go here...
            InkWell(
              onTap: _pickImage,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color: Colors.green),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20),
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _image != null ? 'Gambar Terpilih' : 'Pilih Gambar',
                      style: TextStyle(fontSize: 18),
                    ),
                    Icon(Icons.camera_alt),
                  ],
                ),
              ),
            ),
            // Dropdowns for selecting province, city, and district
            Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: DropdownSearch<Provinsi>(
                    mode: Mode.BOTTOM_SHEET,
                    showSearchBox: true,
                    onChanged: (Provinsi? value) {
                      setState(() {
                        widget.idProvinsi = value?.id ?? "0";
                      });
                    },
                    dropdownBuilder: (BuildContext context,
                            Provinsi? selectedItem) =>
                        Text(selectedItem?.name ?? "Belum memilih Provinsi"),
                    popupItemBuilder: (BuildContext context, Provinsi item,
                            bool isSelected) =>
                        ListTile(
                      title: Text(item.name),
                    ),
                    onFind: (String? text) async {
                      var response = await http.get(Uri.parse(
                          "https://api.binderbyte.com/wilayah/provinsi?api_key=${widget.apiKey}"));
                      if (response.statusCode != 200) {
                        return [];
                      }
                      List<dynamic> allProvince =
                          json.decode(response.body)["value"];
                      List<Provinsi> allModelProvince = [];

                      for (var element in allProvince) {
                        allModelProvince.add(Provinsi.fromJson(element));
                      }
                      return allModelProvince;
                    },
                  ),
                ),
                SizedBox(height: 20),
                if (widget.idProvinsi != "0")
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: DropdownSearch<Kota>(
                      mode: Mode.DIALOG,
                      showSearchBox: true,
                      onChanged: (Kota? value) {
                        setState(() {
                          widget.idKabupaten = value?.id ?? "0";
                        });
                      },
                      dropdownBuilder:
                          (BuildContext context, Kota? selectedItem) =>
                              Text(selectedItem?.name ?? "Belum memilih Kota"),
                      popupItemBuilder:
                          (BuildContext context, Kota item, bool isSelected) =>
                              ListTile(
                        title: Text(item.name),
                      ),
                      onFind: (String? text) async {
                        var response = await http.get(Uri.parse(
                            "https://api.binderbyte.com/wilayah/kabupaten?api_key=${widget.apiKey}&id_provinsi=${widget.idProvinsi}"));
                        if (response.statusCode != 200) {
                          return [];
                        }
                        List<dynamic> allKota =
                            json.decode(response.body)["value"];
                        List<Kota> allModelKota = [];

                        for (var element in allKota) {
                          allModelKota.add(Kota(
                              id: element["id"],
                              idProvinsi: element["id_provinsi"],
                              name: element["name"]));
                        }
                        return allModelKota;
                      },
                    ),
                  ),
                SizedBox(height: 20),
                if (widget.idKabupaten != "0")
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: DropdownSearch<Kecamatan>(
                      mode: Mode.DIALOG,
                      showSearchBox: true,
                      onChanged: (Kecamatan? value) {
                        setState(() {
                          widget.idKecamatan = value?.id ?? "0";
                        });
                      },
                      dropdownBuilder: (BuildContext context,
                              Kecamatan? selectedItem) =>
                          Text(selectedItem?.name ?? "Belum memilih Kecamatan"),
                      popupItemBuilder: (BuildContext context, Kecamatan item,
                              bool isSelected) =>
                          ListTile(
                        title: Text(item.name),
                      ),
                      onFind: (String? text) async {
                        var response = await http.get(Uri.parse(
                            "https://api.binderbyte.com/wilayah/kecamatan?api_key=${widget.apiKey}&id_kabupaten=${widget.idKabupaten}"));
                        if (response.statusCode != 200) {
                          return [];
                        }
                        List<dynamic> allKecamatan =
                            json.decode(response.body)["value"];
                        List<Kecamatan> allModelKecamatan = [];

                        for (var element in allKecamatan) {
                          Kecamatan kecamatan = Kecamatan(
                            id: element["id"],
                            idKabupaten: element["id_kabupaten"],
                            name: element["name"],
                          );
                          allModelKecamatan.add(kecamatan);
                        }
                        return allModelKecamatan;
                      },
                    ),
                  ),
                SizedBox(height: 20),
                if (widget.idKecamatan != "0")
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: DropdownSearch<Kelurahan>(
                      mode: Mode.DIALOG,
                      showSearchBox: true,
                      onChanged: (Kelurahan? value) {
                        // Handle the selected Kelurahan
                      },
                      dropdownBuilder: (BuildContext context,
                              Kelurahan? selectedItem) =>
                          Text(selectedItem?.name ?? "Belum memilih Kelurahan"),
                      popupItemBuilder: (BuildContext context, Kelurahan item,
                              bool isSelected) =>
                          ListTile(
                        title: Text(item.name),
                      ),
                      onFind: (String? text) async {
                        var response = await http.get(Uri.parse(
                            "https://api.binderbyte.com/wilayah/kelurahan?api_key=${widget.apiKey}&id_kecamatan=${widget.idKecamatan}"));
                        if (response.statusCode != 200) {
                          return [];
                        }
                        List<dynamic> allKelurahan =
                            json.decode(response.body)["value"];
                        List<Kelurahan> allModelKelurahan = [];

                        for (var element in allKelurahan) {
                          Kelurahan kelurahan = Kelurahan(
                            id: element["id"],
                            idKecamatan: element["id_kecamatan"],
                            name: element["name"],
                          );
                          allModelKelurahan.add(kelurahan);
                        }
                        return allModelKelurahan;
                      },
                    ),
                  ),
              ],
            ),

            SizedBox(height: 20),
            // Register Button
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ElevatedButton(
                onPressed: _register,
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
          ],
        ),
      ),
    );
  }
}
