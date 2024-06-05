import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

void main() {
  runApp(MaterialApp(
    home: LahanPage(),
  ));
}

class LahanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Text('Lahan Anda'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Anda belum memiliki lahan.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
            FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FormulirLahan()),
                );
              },
              child: Icon(Icons.add),
              backgroundColor: Color(0xFF6EBF45),
            ),
          ],
        ),
      ),
    );
  }
}

class FormulirLahan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulir Penambahan Lahan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  File? _image;
  String _ownershipStatus = 'Owned';
  String _landStatus = 'Unmapped';
  bool _showLandStatus = false;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _coordinatesController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final uri = Uri.parse('http://bfarm.ahmadyaz.my.id/api/lands');
      final request = http.MultipartRequest('POST', uri);

      request.fields['ownership_status'] = _ownershipStatus;
      request.fields['land_status'] = _landStatus;
      request.fields['full_address'] = _addressController.text;
      request.fields['postal_code'] = _postalCodeController.text;
      request.fields['land_area'] = _areaController.text;
      request.fields['location'] = _coordinatesController.text;
      request.fields['land_desc'] = _descriptionController.text;

      if (_image != null) {
        final mimeTypeData = lookupMimeType(_image!.path, headerBytes: [0xFF, 0xD8])?.split('/');
        final file = await http.MultipartFile.fromPath(
          'image',
          _image!.path,
          contentType: MediaType(mimeTypeData![0], mimeTypeData[1]),
        );
        request.files.add(file);
      }

      try {
        final response = await request.send();
        if (response.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Lahan berhasil disimpan!')),
          );
          Navigator.pop(context);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Gagal menyimpan lahan! Kode: ${response.statusCode}')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Terjadi kesalahan: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 8),
              child: Text(
                'Pilih Tipe Kepemilikan',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _ownershipStatus = 'Owned';
                          _landStatus = 'Unmapped';
                          _showLandStatus = false;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: _ownershipStatus == 'Owned' ? Colors.green : Colors.grey[200],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          'Milik Sendiri',
                          style: TextStyle(
                            color: _ownershipStatus == 'Owned' ? Colors.white : Colors.black,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _ownershipStatus = 'Rent';
                          _landStatus = 'Unmapped';
                          _showLandStatus = false;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: _ownershipStatus == 'Rent' ? Colors.green : Colors.grey[200],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          'Sewa',
                          style: TextStyle(
                            color: _ownershipStatus == 'Rent' ? Colors.white : Colors.black,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Visibility(
              visible: _showLandStatus,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 8),
                child: Text(
                  'Status Lahan',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: _showLandStatus,
             child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _landStatus = 'Unmapped';
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: _landStatus == 'Unmapped' ? Colors.green : Colors.grey[200],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            'Unmapped',
                            style: TextStyle(
                              color: _landStatus == 'Unmapped' ? Colors.white : Colors.black,
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _landStatus = 'Mapped';
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: _landStatus == 'Mapped' ? Colors.green : Colors.grey[200],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            'Mapped',
                            style: TextStyle(
                              color: _landStatus == 'Mapped' ? Colors.white : Colors.black,
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            CustomTextFormField(
              controller: _addressController,
              label: 'Alamat Lengkap',
              hint: 'Alamat Lengkap Lahan',
            ),
            SizedBox(height: 10),
            CustomTextFormField(
              controller: _postalCodeController,
              label: 'Kode Pos',
              hint: 'Isikan Kode Pos Anda',
            ),
            SizedBox(height: 10),
            CustomTextFormField(
              controller: _areaController,
              label: 'Luas Lahan',
              hint: 'Isikan Nama Luas Lahan per- Hektar (Ha)',
            ),
            SizedBox(height: 10),
            CustomTextFormField(
              controller: _coordinatesController,
              label: 'Koordinat Lokasi',
              hint: 'Isikan Titik Lokasi  contoh: (-7.66519, 111.31629)',
            ),
            SizedBox(height: 10),
            CustomTextFormField(
              controller: _descriptionController,
              label: 'Deskripsi',
              hint: 'Masukkan Deskripsi Pengajuan Lahan (maksimal 250 kata)',
              maxLines: 3,
            ),
            SizedBox(height: 10),
            Text(
              'Unggah Gambar Lahan',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 8),
            InkWell(
              onTap: _pickImage,
              child: Container(
                width: double.infinity,
               decoration: BoxDecoration(
                  color: Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20),
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          _image != null ? _image!.path.split('/').last : 'Pilih Gambar',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16,
                            color: _image != null ? Colors.black : Colors.grey,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.camera_alt,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF6EBF45),
                  foregroundColor: Colors.white,
                ),
                child: Text('SIMPAN'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final int? maxLines;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.label,
    required this.hint,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 8),
          TextFormField(
            controller: controller,
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: hint,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            ),
          ),
        ],
      ),
    );
  }
}