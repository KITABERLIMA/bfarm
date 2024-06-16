import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'lahan.dart';

class FormulirPenambahanLahan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Formulir Penambahan Lahan',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: MyCustomForm(
          apiKey:
              '2ed019ca673ef08cc29666f0af5faa5cc30d16ddb4882770297948bed8e54452',
        ),
      ),
    );
  }
}

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

class MyCustomForm extends StatefulWidget {
  final String apiKey;
  String idProvinsi = "0";
  String idKabupaten = "0";
  String idKecamatan = "0";
  MyCustomForm({required this.apiKey});
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _landDescribeController = TextEditingController();
  final TextEditingController _location = TextEditingController();
  final TextEditingController _landArea = TextEditingController();
  final TextEditingController _fullAddressController = TextEditingController();
  final TextEditingController _provinceController = TextEditingController();
  final TextEditingController _cityDistrictController = TextEditingController();
  final TextEditingController _subDistrictController = TextEditingController();
  final TextEditingController _villageController = TextEditingController();
  final TextEditingController _postalController = TextEditingController();

  String? _landStatusController = "unmapped";
  String? _ownershipStatusController = "owned";
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

  Future<void> _tambahlahan() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Token is missing")),
      );
      return;
    }

    if (_formKey.currentState!.validate()) {
      if (_landStatusController == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please select a land status")),
        );
        return;
      }

      if (_selectedImage == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please select an image")),
        );
        return;
      }

      var uri = Uri.parse("http://bfarm.ahmadyaz.my.id/api/lands");

      var request = http.MultipartRequest("POST", uri)
        ..headers['Authorization'] = 'Bearer $token';

      request.fields['land_status'] = _landStatusController!;
      request.fields['land_description'] = _landDescribeController.text;
      request.fields['ownership_status'] = _ownershipStatusController!;
      request.fields['location'] = _location.text.trim();
      request.fields['land_area'] = _landArea.text;
      request.fields['postal_code'] = _postalController.text;
      request.fields['full_address'] = _fullAddressController.text;
      request.fields['province'] = _provinceController.text;
      request.fields['city_district'] = _cityDistrictController.text;
      request.fields['sub_district'] = _subDistrictController.text;
      request.fields['village'] = _villageController.text;

      var imageFile =
          await http.MultipartFile.fromPath('image', _selectedImage!.path);
      request.files.add(imageFile);

      var response = await request.send();
      var responseBody = await response.stream.bytesToString();

      print('Response status: ${response.statusCode}');
      print('Response body: $responseBody');

      try {
        var jsonResponse = jsonDecode(responseBody);

        if (response.statusCode == 200 && jsonResponse['success'] == true) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Penambahan Lahan Berhasil!")),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    LahanPage()), // Implementasikan LahanPage atau ganti dengan halaman tujuan
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Registration failed: $responseBody")),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to decode response: $responseBody")),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill all required fields.")),
      );
    }
  }

  final FocusNode _landStatusFocusNode = FocusNode();
  final FocusNode _landDescribeFocusNode = FocusNode();
  final FocusNode _ownershipStatusFocusNode = FocusNode();
  final FocusNode _locationFocusNode = FocusNode();
  final FocusNode _landAreaFocusNode = FocusNode();
  final FocusNode _fullAddressFocusNode = FocusNode();
  final FocusNode _provinceFocusNode = FocusNode();
  final FocusNode _cityDistrictFocusNode = FocusNode();
  final FocusNode _subDistrictFocusNode = FocusNode();
  final FocusNode _villageFocusNode = FocusNode();
  final FocusNode _postalFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _landDescribeFocusNode.addListener(() {
      setState(() {});
    });
    _ownershipStatusFocusNode.addListener(() {
      setState(() {});
    });
    _locationFocusNode.addListener(() {
      setState(() {});
    });
    _landAreaFocusNode.addListener(() {
      setState(() {});
    });
    _fullAddressFocusNode.addListener(() {
      setState(() {});
    });
    _provinceFocusNode.addListener(() {
      setState(() {});
    });
    _cityDistrictFocusNode.addListener(() {
      setState(() {});
    });
    _subDistrictFocusNode.addListener(() {
      setState(() {});
    });
    _villageFocusNode.addListener(() {
      setState(() {});
    });
    _postalFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _landStatusFocusNode.dispose();
    _landDescribeFocusNode.dispose();
    _ownershipStatusFocusNode.dispose();
    _locationFocusNode.dispose();
    _landAreaFocusNode.dispose();
    _fullAddressFocusNode.dispose();
    _provinceFocusNode.dispose();
    _cityDistrictFocusNode.dispose();
    _subDistrictFocusNode.dispose();
    _villageFocusNode.dispose();
    _postalFocusNode.dispose();
    super.dispose();
  }

  Future<List<Provinsi>> _fetchProvinces() async {
    var response = await http.get(Uri.parse(
        'https://api.binderbyte.com/wilayah/provinsi?api_key=${widget.apiKey}'));

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse); // Debugging log
      var provinces = (jsonResponse['value'] as List)
          .map((data) => Provinsi.fromJson(data))
          .toList();
      return provinces;
    } else {
      print('Failed to load provinces'); // Debugging log
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          SizedBox(height: 10),
          Text('Selamat datang di halaman Lahan!'),
          SizedBox(height: 10),
          DropdownButtonFormField<String>(
            value: _landStatusController,
            items: [
              DropdownMenuItem(value: 'unmapped', child: Text('Unmapped')),
            ],
            onChanged: (value) {
              setState(() {
                _landStatusController = value;
              });
            },
            decoration: InputDecoration(
              labelText: 'Status Lahan',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          DropdownButtonFormField<String>(
            value: _ownershipStatusController,
            items: [
              DropdownMenuItem(value: 'owned', child: Text('Owned')),
            ],
            onChanged: (value) {
              setState(() {
                _ownershipStatusController = value;
              });
            },
            decoration: InputDecoration(
              labelText: 'Status Kepemilikan',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: _landDescribeController,
            focusNode: _landDescribeFocusNode,
            decoration: InputDecoration(
              labelText: 'Deskripsi Lahan',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Deskripsi lahan harus diisi';
              }
              return null;
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: _location,
            focusNode: _locationFocusNode,
            decoration: InputDecoration(
              labelText: 'Lokasi',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Lokasi harus diisi';
              }
              return null;
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: _landArea,
            focusNode: _landAreaFocusNode,
            decoration: InputDecoration(
              labelText: 'Luas Lahan (m2)',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Luas lahan harus diisi';
              }
              return null;
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: _fullAddressController,
            focusNode: _fullAddressFocusNode,
            decoration: InputDecoration(
              labelText: 'Alamat Lengkap',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Alamat lengkap harus diisi';
              }
              return null;
            },
          ),
          SizedBox(height: 10),
          DropdownSearch<Provinsi>(
            asyncItems: (String filter) async {
              var response = await http.get(Uri.parse(
                  'https://api.binderbyte.com/wilayah/provinsi?api_key=${widget.apiKey}'));
              if (response.statusCode == 200) {
                var jsonResponse = jsonDecode(response.body);
                print(jsonResponse); // Debugging log
                return (jsonResponse['value'] as List)
                    .map((data) => Provinsi.fromJson(data))
                    .toList();
              }
              print('Failed to load provinces'); // Debugging log
              return [];
            },
            itemAsString: (Provinsi p) => p.name,
            onChanged: (Provinsi? value) {
              if (value != null) {
                setState(() {
                  widget.idProvinsi = value.id;
                  _provinceController.text = value.name;
                });
              }
            },
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: 'Province',
              ),
            ),
            popupProps: PopupProps.menu(
              showSearchBox: true,
            ),
            validator: (value) =>
                value == null ? 'Please select a province' : null,
          ),
          DropdownSearch<Kota>(
            asyncItems: (String filter) async {
              var response = await http.get(Uri.parse(
                  'https://api.binderbyte.com/wilayah/kabupaten?api_key=${widget.apiKey}&id_provinsi=${widget.idProvinsi}'));
              if (response.statusCode == 200) {
                var jsonResponse = jsonDecode(response.body);
                print(jsonResponse); // Debugging log
                return (jsonResponse['value'] as List)
                    .map((data) => Kota.fromJson(data))
                    .toList();
              }
              print('Failed to load cities'); // Debugging log
              return [];
            },
            itemAsString: (Kota k) => k.name,
            onChanged: (Kota? value) {
              if (value != null) {
                setState(() {
                  widget.idKabupaten = value.id;
                  _cityDistrictController.text = value.name;
                });
              }
            },
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: 'City/District',
              ),
            ),
            popupProps: PopupProps.menu(
              showSearchBox: true,
            ),
            validator: (value) =>
                value == null ? 'Please select a city/district' : null,
          ),
          DropdownSearch<Kecamatan>(
            asyncItems: (String filter) async {
              var response = await http.get(Uri.parse(
                  'https://api.binderbyte.com/wilayah/kecamatan?api_key=${widget.apiKey}&id_kabupaten=${widget.idKabupaten}'));
              if (response.statusCode == 200) {
                var jsonResponse = jsonDecode(response.body);
                print(jsonResponse); // Debugging log
                return (jsonResponse['value'] as List)
                    .map((data) => Kecamatan.fromJson(data))
                    .toList();
              }
              print('Failed to load sub-districts'); // Debugging log
              return [];
            },
            itemAsString: (Kecamatan k) => k.name,
            onChanged: (Kecamatan? value) {
              if (value != null) {
                setState(() {
                  widget.idKecamatan = value.id;
                  _subDistrictController.text = value.name;
                });
              }
            },
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: 'Sub-district',
              ),
            ),
            popupProps: PopupProps.menu(
              showSearchBox: true,
            ),
            validator: (value) =>
                value == null ? 'Please select a sub-district' : null,
          ),
          DropdownSearch<Kelurahan>(
            asyncItems: (String filter) async {
              var response = await http.get(Uri.parse(
                  'https://api.binderbyte.com/wilayah/kelurahan?api_key=${widget.apiKey}&id_kecamatan=${widget.idKecamatan}'));
              if (response.statusCode == 200) {
                var jsonResponse = jsonDecode(response.body);
                print(jsonResponse); // Debugging log
                return (jsonResponse['value'] as List)
                    .map((data) => Kelurahan.fromJson(data))
                    .toList();
              }
              print('Failed to load villages'); // Debugging log
              return [];
            },
            itemAsString: (Kelurahan k) => k.name,
            onChanged: (Kelurahan? value) {
              if (value != null) {
                setState(() {
                  _villageController.text = value.name;
                });
              }
            },
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: 'Village',
              ),
            ),
            popupProps: PopupProps.menu(
              showSearchBox: true,
            ),
            validator: (value) =>
                value == null ? 'Please select a village' : null,
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: _postalController,
            focusNode: _postalFocusNode,
            decoration: InputDecoration(
              labelText: 'Postal Code',
              labelStyle: TextStyle(
                color: _postalFocusNode.hasFocus ? Colors.lightGreen : null,
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: _postalFocusNode.hasFocus
                      ? Colors.lightGreen
                      : Colors.grey,
                ),
              ),
            ),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null) {
                return 'Please enter your postal code';
              }
              return null;
            },
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: _pickImage,
            child: Text('Pilih Gambar'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Color(0xFF6EBF45), // Warna latar belakang tombol
            ),
          ),
          if (_selectedImage != null)
            Image.file(_selectedImage!)
          else
            Text('Belum ada gambar yang dipilih'),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _tambahlahan,
            child: Text('Tambah Lahan'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Color(0xFF6EBF45),
            ),
          ),
        ],
      ),
    );
  }
}
