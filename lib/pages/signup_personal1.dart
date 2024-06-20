import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'package:dropdown_search/dropdown_search.dart';
import 'otp.dart';

void main() {
  runApp(MaterialApp(
    home: RegisterForm(
      apiKey:
          '2ed019ca673ef08cc29666f0af5faa5cc30d16ddb4882770297948bed8e54452',
    ),
  ));
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

class RegisterForm extends StatefulWidget {
  final String apiKey;
  String idProvinsi = "0";
  String idKabupaten = "0";
  String idKecamatan = "0";
  RegisterForm({required this.apiKey});
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
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

      var request = http.MultipartRequest("POST", uri);

      request.fields['user_type'] = _userType!;
      request.fields['first_name'] = _firstNameController.text;
      request.fields['last_name'] = _lastNameController.text;
      request.fields['email'] = _emailController.text.trim();
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
    }
  }

  final FocusNode _firstNameFocusNode = FocusNode();
  final FocusNode _lastNameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _fullAddressFocusNode = FocusNode();
  final FocusNode _postalCodeFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _firstNameFocusNode.addListener(() {
      setState(() {});
    });
    _lastNameFocusNode.addListener(() {
      setState(() {});
    });
    _emailFocusNode.addListener(() {
      setState(() {});
    });
    _passwordFocusNode.addListener(() {
      setState(() {});
    });
    _phoneFocusNode.addListener(() {
      setState(() {});
    });
    _fullAddressFocusNode.addListener(() {
      setState(() {});
    });
    _postalCodeFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _firstNameFocusNode.dispose();
    _lastNameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _phoneFocusNode.dispose();
    _fullAddressFocusNode.dispose();
    _postalCodeFocusNode.dispose();
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _firstNameController,
                focusNode: _firstNameFocusNode,
                decoration: InputDecoration(
                  labelText: 'First Name',
                  labelStyle: TextStyle(
                    color:
                        _firstNameFocusNode.hasFocus ? Colors.lightGreen : null,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: _firstNameFocusNode.hasFocus
                          ? Colors.lightGreen
                          : Colors.grey,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Please enter your first name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _lastNameController,
                focusNode: _lastNameFocusNode,
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  labelStyle: TextStyle(
                    color:
                        _lastNameFocusNode.hasFocus ? Colors.lightGreen : null,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: _lastNameFocusNode.hasFocus
                          ? Colors.lightGreen
                          : Colors.grey,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Please enter your last name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                focusNode: _emailFocusNode,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    color: _emailFocusNode.hasFocus ? Colors.lightGreen : null,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: _emailFocusNode.hasFocus
                          ? Colors.lightGreen
                          : Colors.grey,
                    ),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                focusNode: _passwordFocusNode,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color:
                        _passwordFocusNode.hasFocus ? Colors.lightGreen : null,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: _passwordFocusNode.hasFocus
                          ? Colors.lightGreen
                          : Colors.grey,
                    ),
                  ),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _phoneController,
                focusNode: _phoneFocusNode,
                decoration: InputDecoration(
                  labelText: 'Phone',
                  labelStyle: TextStyle(
                    color: _phoneFocusNode.hasFocus ? Colors.lightGreen : null,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: _phoneFocusNode.hasFocus
                          ? Colors.lightGreen
                          : Colors.grey,
                    ),
                  ),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _fullAddressController,
                focusNode: _fullAddressFocusNode,
                decoration: InputDecoration(
                  labelText: 'Full Address',
                  labelStyle: TextStyle(
                    color: _fullAddressFocusNode.hasFocus
                        ? Colors.lightGreen
                        : null,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: _fullAddressFocusNode.hasFocus
                          ? Colors.lightGreen
                          : Colors.grey,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Please enter your full address';
                  }
                  return null;
                },
              ),
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
              TextFormField(
                controller: _postalCodeController,
                focusNode: _postalCodeFocusNode,
                decoration: InputDecoration(
                  labelText: 'Postal Code',
                  labelStyle: TextStyle(
                    color: _postalCodeFocusNode.hasFocus
                        ? Colors.lightGreen
                        : null,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: _postalCodeFocusNode.hasFocus
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
              TextFormField(
                initialValue: 'individual',
                decoration: InputDecoration(
                  labelText: 'User Type',
                  labelStyle: TextStyle(color: Colors.grey), // Mengubah warna label menjadi abu-abu
                ),
                enabled: false, // Menonaktifkan TextFormField agar tidak bisa diedit
                style: TextStyle(color: Colors.grey), // Mengubah warna teks menjadi abu-abu
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a user type';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
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
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _register,
                child: Text("Register"),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xFF6EBF45),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
