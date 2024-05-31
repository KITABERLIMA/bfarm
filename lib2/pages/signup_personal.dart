import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'otp.dart';

void main() {
  runApp(MaterialApp(
    home: RegistrationPage(
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

class RegistrationPage extends StatefulWidget {
  final String apiKey; // API key for fetching region data
  String idProvinsi = "0";
  String idKabupaten = "0";
  String idKecamatan = "0";

  RegistrationPage({required this.apiKey});

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
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

  String? _userType;
  File? _selectedImage; // Variabel untuk menyimpan gambar yang dipilih

  // Fungsi untuk mengambil gambar dari galeri
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
          MaterialPageRoute(builder: (context) => OTPScreen()),
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pendaftaran"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            TextField(
              controller: _firstNameController,
              decoration: InputDecoration(
                labelText: 'Nama Depan',
              ),
            ),
            TextField(
              controller: _lastNameController,
              decoration: InputDecoration(
                labelText: 'Nama Belakang',
              ),
            ),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Nomor Telepon',
              ),
            ),
            DropdownButtonFormField<String>(
              value: _userType,
              onChanged: (value) {
                setState(() {
                  _userType = value;
                });
              },
              items: [
                DropdownMenuItem(
                  child: Text("Individual"),
                  value: "individual",
                ),
                DropdownMenuItem(
                  child: Text("Corporate"),
                  value: "corporate",
                ),
              ],
              decoration: InputDecoration(
                labelText: "User Type",
              ),
              validator: (value) {
                if (value == null) {
                  return 'Please select a user type';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Kata Sandi',
              ),
            ),
            TextField(
              controller: _fullAddressController,
              decoration: InputDecoration(
                labelText: 'Alamat Lengkap',
              ),
            ),
            TextField(
              controller: _postalCodeController,
              decoration: InputDecoration(
                labelText: 'Kode Pos',
              ),
            ),

            // Dropdown for choosing province
            DropdownSearch<Provinsi>(
              mode: Mode.BOTTOM_SHEET,
              showSearchBox: true,
              dropdownBuilder: (BuildContext context, Provinsi? selectedItem) =>
                  Text(selectedItem?.name ?? "Belum memilih Provinsi"),
              popupItemBuilder:
                  (BuildContext context, Provinsi item, bool isSelected) =>
                      ListTile(
                title: Text(item.name),
              ),
              // Remove the duplicate named argument 'showSearchBox'
              onFind: (String? text) async {
                var response = await http.get(Uri.parse(
                    "https://api.binderbyte.com/wilayah/provinsi?api_key=${widget.apiKey}"));
                if (response.statusCode != 200) {
                  return [];
                }
                List<dynamic> allProvince = json.decode(response.body)["value"];
                List<Provinsi> allModelProvince = [];

                for (var element in allProvince) {
                  allModelProvince.add(Provinsi.fromJson(element));
                }
                return allModelProvince;
              },
              onChanged: (Provinsi? value) {
                if (value != null) {
                  setState(() {
                    widget.idProvinsi = value.id;
                    _provinceController.text = value.name;
                  });
                }
              },
            ),

            // Dropdown for choosing city based on selected province
            if (widget.idProvinsi != "0")
              DropdownSearch<Kota>(
                mode: Mode.DIALOG,
                showSearchBox: true,
                dropdownBuilder: (BuildContext context, Kota? selectedItem) =>
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
                  List<dynamic> allKota = json.decode(response.body)["value"];
                  List<Kota> allModelKota = [];

                  for (var element in allKota) {
                    allModelKota.add(Kota.fromJson(element));
                  }
                  return allModelKota;
                },
                onChanged: (Kota? value) {
                  if (value != null) {
                    setState(() {
                      widget.idKabupaten = value.id;
                      _cityDistrictController.text = value.name;
                    });
                  }
                },
              ),

            // Dropdown for choosing sub-district based on selected city
            if (widget.idKabupaten != "0")
              DropdownSearch<Kecamatan>(
                mode: Mode.DIALOG,
                showSearchBox: true,
                dropdownBuilder:
                    (BuildContext context, Kecamatan? selectedItem) =>
                        Text(selectedItem?.name ?? "Belum memilih Kecamatan"),
                popupItemBuilder:
                    (BuildContext context, Kecamatan item, bool isSelected) =>
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
                    allModelKecamatan.add(Kecamatan.fromJson(element));
                  }
                  return allModelKecamatan;
                },
                onChanged: (Kecamatan? value) {
                  if (value != null) {
                    setState(() {
                      widget.idKecamatan = value.id;
                      _subDistrictController.text = value.name;
                    });
                  }
                },
              ),

            // Dropdown for choosing village based on selected sub-district
            if (widget.idKecamatan != "0")
              DropdownSearch<Kelurahan>(
                mode: Mode.BOTTOM_SHEET,
                showSearchBox: true,
                dropdownBuilder:
                    (BuildContext context, Kelurahan? selectedItem) =>
                        Text(selectedItem?.name ?? "Belum memilih Kelurahan"),
                popupItemBuilder:
                    (BuildContext context, Kelurahan item, bool isSelected) =>
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
                    allModelKelurahan.add(Kelurahan.fromJson(element));
                  }
                  return allModelKelurahan;
                },
                onChanged: (Kelurahan? value) {
                  if (value != null) {
                    _villageController.text = value.name;
                  }
                },
              ),
// Menampilkan gambar yang dipilih
            if (_selectedImage != null)
              Image.file(
                _selectedImage!,
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),

            // Tombol untuk memilih gambar dari galeri
            ElevatedButton(
              onPressed: _pickImage,
              child: Text("Select Profile Picture"),
            ),
            if (_selectedImage != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Image.file(
                  _selectedImage!,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _register();
              },
              child: Text("Daftar"),
            ),
          ],
        ),
      ),
    );
  }
}
