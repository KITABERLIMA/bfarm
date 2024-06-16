import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dropdown_search/dropdown_search.dart';

import '../home pages/lahan.dart';

class FormulirPenambahanLahan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulir Penambahan Lahan'),
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
  final TextEditingController _villageController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

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
    if (_formKey.currentState!.validate()) {
      if (_landStatusController == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please select a land status")),
        );
        return;
      }

      if (_selectedImage == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please select a profile picture")),
        );
        return;
      }

      var uri = Uri.parse("http://bfarm.ahmadyaz.my.id/api/lands");

      var request = http.MultipartRequest("POST", uri);

      request.fields['land_status'] = _landStatusController!;
      request.fields['land_description'] = _landDescribeController.text;
      request.fields['ownership_status'] =
          _ownershipStatusController.toString();
      request.fields['location'] = _location.text.trim();
      request.fields['land_area'] = _landArea.text;
      request.fields['phone'] = _phoneController.text;
      request.fields['full_address'] = _fullAddressController.text;
      request.fields['province'] = widget.idProvinsi;
      request.fields['city_district'] = widget.idKabupaten;
      request.fields['sub_district'] = widget.idKecamatan;
      request.fields['village'] = _villageController.text;

      var imageFile =
          await http.MultipartFile.fromPath('image', _selectedImage!.path);
      request.files.add(imageFile);

      var response = await request.send();
      var responseBody = await response.stream.bytesToString();
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
      throw Exception('Failed to load provinces');
    }
  }

  Future<List<Kota>> _fetchCities(String idProvinsi) async {
    var response = await http.get(Uri.parse(
        'https://api.binderbyte.com/wilayah/kabupaten?api_key=${widget.apiKey}&id_provinsi=$idProvinsi'));

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse); // Debugging log
      var cities = (jsonResponse['value'] as List)
          .map((data) => Kota.fromJson(data))
          .toList();
      return cities;
    } else {
      throw Exception('Failed to load cities');
    }
  }

  Future<List<Kecamatan>> _fetchDistricts(String idKabupaten) async {
    var response = await http.get(Uri.parse(
        'https://api.binderbyte.com/wilayah/kecamatan?api_key=${widget.apiKey}&id_kabupaten=$idKabupaten'));

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse); // Debugging log
      var districts = (jsonResponse['value'] as List)
          .map((data) => Kecamatan.fromJson(data))
          .toList();
      return districts;
    } else {
      throw Exception('Failed to load districts');
    }
  }

  Future<List<Kelurahan>> _fetchVillages(String idKecamatan) async {
    var response = await http.get(Uri.parse(
        'https://api.binderbyte.com/wilayah/kelurahan?api_key=${widget.apiKey}&id_kecamatan=$idKecamatan'));

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse); // Debugging log
      var villages = (jsonResponse['value'] as List)
          .map((data) => Kelurahan.fromJson(data))
          .toList();
      return villages;
    } else {
      throw Exception('Failed to load villages');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          Text(
            'Formulir Penambahan Lahan',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),
          DropdownButtonFormField<String>(
            focusNode: _landStatusFocusNode,
            decoration: InputDecoration(
              labelText: 'Status Lahan',
              border: OutlineInputBorder(),
            ),
            value: _landStatusController,
            items: [
              DropdownMenuItem(
                value: 'unmapped',
                child: Text('Belum Terpetakan'),
              ),
              DropdownMenuItem(
                value: 'mapped',
                child: Text('Sudah Terpetakan'),
              ),
            ],
            onChanged: (value) {
              setState(() {
                _landStatusController = value;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Status lahan harus diisi';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          TextFormField(
            focusNode: _landDescribeFocusNode,
            controller: _landDescribeController,
            decoration: InputDecoration(
              labelText: 'Deskripsi Lahan',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Deskripsi lahan harus diisi';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          DropdownButtonFormField<String>(
            focusNode: _ownershipStatusFocusNode,
            decoration: InputDecoration(
              labelText: 'Status Kepemilikan',
              border: OutlineInputBorder(),
            ),
            value: _ownershipStatusController,
            items: [
              DropdownMenuItem(
                value: 'owned',
                child: Text('Milik Sendiri'),
              ),
              DropdownMenuItem(
                value: 'rented',
                child: Text('Sewa'),
              ),
              DropdownMenuItem(
                value: 'other',
                child: Text('Lainnya'),
              ),
            ],
            onChanged: (value) {
              setState(() {
                _ownershipStatusController = value;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Status kepemilikan harus diisi';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          TextFormField(
            focusNode: _locationFocusNode,
            controller: _location,
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
          SizedBox(height: 20),
          TextFormField(
            focusNode: _landAreaFocusNode,
            controller: _landArea,
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
          SizedBox(height: 20),
          TextFormField(
            focusNode: _fullAddressFocusNode,
            controller: _fullAddressController,
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
          SizedBox(height: 20),
          FutureBuilder<List<Provinsi>>(
            future: _fetchProvinces(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Text('Tidak ada data provinsi');
              } else {
                return DropdownSearch<Provinsi>(
                  items: snapshot.data!,
                  itemAsString: (Provinsi u) => u.name,
                  onChanged: (Provinsi? data) {
                    setState(() {
                      widget.idProvinsi = data?.id ?? "0";
                    });
                  },
                  selectedItem: snapshot.data!.first,
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      labelText: 'Pilih Provinsi',
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.name.isEmpty) {
                      return 'Provinsi harus diisi';
                    }
                    return null;
                  },
                );
              }
            },
          ),
          SizedBox(height: 20),
          FutureBuilder<List<Kota>>(
            future: _fetchCities(widget.idProvinsi),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Text('Tidak ada data kota');
              } else {
                return DropdownSearch<Kota>(
                  items: snapshot.data!,
                  itemAsString: (Kota u) => u.name,
                  onChanged: (Kota? data) {
                    setState(() {
                      widget.idKabupaten = data?.id ?? "0";
                    });
                  },
                  selectedItem: snapshot.data!.first,
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      labelText: 'Pilih Kota/Kabupaten',
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.name.isEmpty) {
                      return 'Kota/Kabupaten harus diisi';
                    }
                    return null;
                  },
                );
              }
            },
          ),
          SizedBox(height: 20),
          FutureBuilder<List<Kecamatan>>(
            future: _fetchDistricts(widget.idKabupaten),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Text('Tidak ada data kecamatan');
              } else {
                return DropdownSearch<Kecamatan>(
                  items: snapshot.data!,
                  itemAsString: (Kecamatan u) => u.name,
                  onChanged: (Kecamatan? data) {
                    setState(() {
                      widget.idKecamatan = data?.id ?? "0";
                    });
                  },
                  selectedItem: snapshot.data!.first,
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      labelText: 'Pilih Kecamatan',
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.name.isEmpty) {
                      return 'Kecamatan harus diisi';
                    }
                    return null;
                  },
                );
              }
            },
          ),
          SizedBox(height: 20),
          FutureBuilder<List<Kelurahan>>(
            future: _fetchVillages(widget.idKecamatan),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Text('Tidak ada data kelurahan');
              } else {
                return DropdownSearch<Kelurahan>(
                  items: snapshot.data!,
                  itemAsString: (Kelurahan u) => u.name,
                  onChanged: (Kelurahan? data) {
                    setState(() {
                      widget.idKecamatan = data?.id ?? "0";
                    });
                  },
                  selectedItem: snapshot.data!.first,
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      labelText: 'Pilih Kelurahan',
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.name.isEmpty) {
                      return 'Kelurahan harus diisi';
                    }
                    return null;
                  },
                );
              }
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Process data.
              }
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
