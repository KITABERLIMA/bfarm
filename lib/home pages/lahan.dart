import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'formulir_lahan.dart'; // Pastikan ini diimpor dengan benar
import 'package:shared_preferences/shared_preferences.dart';

class LahanPage extends StatefulWidget {
  @override
  _LahanPageState createState() => _LahanPageState();
}

class _LahanPageState extends State<LahanPage> {
  List<dynamic> _landData = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchLandData();
  }

  Future<void> _fetchLandData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      // Tangani ketidakadaan token (misalnya, arahkan ke login)
      return;
    }

    final response = await http.get(
      Uri.parse('http://bfarm.ahmadyaz.my.id/api/user-land'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);

      // Cetak data respons lengkap untuk debugging
      print('Response Data: $responseData');

      if (responseData is Map<String, dynamic> &&
          responseData['data'] is List) {
        setState(() {
          _landData = responseData['data'];
          _isLoading = false;
        });
      } else {
        // Tangani struktur respons yang tidak diharapkan
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Struktur respons tidak terduga')),
        );
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      // Tangani kesalahan API
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal mendapatkan data lahan')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lahan Anda'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _landData.isEmpty
              ? Center(
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
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: _landData.length,
                  itemBuilder: (context, index) {
                    var land = _landData[index];
                    String? imageUrl = land['land_images'] != null &&
                            land['land_images'].isNotEmpty
                        ? 'http://bfarm.ahmadyaz.my.id/storage/' +
                            land['land_images'][0]['image']
                        : null;

                    // Cetak URL gambar untuk debugging
                    print('Image URL: $imageUrl');

                    return Card(
                      margin: EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (imageUrl != null && imageUrl.isNotEmpty)
                              Image.network(
                                imageUrl,
                                height: 200,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  print('Error loading image: $error');
                                  return Text(
                                    'Gagal memuat gambar',
                                    style: TextStyle(color: Colors.red),
                                  );
                                },
                              )
                            else
                              Text(
                                'Gambar tidak tersedia',
                                style: TextStyle(color: Colors.grey),
                              ),
                            SizedBox(height: 10),
                            Text(
                              land['land_description'] ?? 'Tidak ada deskripsi',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Lokasi: ${land['location']}',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey[600],
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Luas: ${land['land_area']} m2',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FormulirPenambahanLahan()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF6EBF45),
      ),
    );
  }
}
