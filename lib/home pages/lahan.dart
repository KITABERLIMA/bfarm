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
                    color: Colors.white,
                    elevation: 5,
                    margin: EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (imageUrl != null && imageUrl.isNotEmpty)
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
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
                                  ),
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
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.7),
                                shape: BoxShape.circle,
                              ),
                              child: PopupMenuButton<String>(
                                icon: Icon(Icons.more_vert),
                                onSelected: (value) {
                                  if (value == 'edit') {
                                    // Implement the edit functionality here
                                    print('Edit selected for ${land['land_description']}');
                                  } else if (value == 'delete') {
                                    // Implement the delete functionality here
                                    print('Delete selected for ${land['land_description']}');
                                  }
                                },
                                itemBuilder: (BuildContext context) {
                                  return {'Edit', 'Delete'}.map((String choice) {
                                    return PopupMenuItem<String>(
                                      value: choice.toLowerCase(),
                                      child: Text(choice),
                                    );
                                  }).toList();
                                },
                              ),
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
