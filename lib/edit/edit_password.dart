import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(EditPasswordApp());
}

class EditPassword extends StatefulWidget {
  @override
  _EditPasswordState createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
  String imageUrl = '';
  String firstName = '';
  String lastName = '';
  String userType = '';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      // Handle case when token is not found
      return;
    }

    final response = await http.get(
      Uri.parse('http://bfarm.ahmadyaz.my.id/api/users'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      if (responseData.containsKey('data')) {
        var userAdditionalData = responseData['data']['user_additional_data'];
        var userImage = responseData['data']['user_image'];
        setState(() {
          imageUrl = 'http://bfarm.ahmadyaz.my.id/storage/' +
              (userImage['image'] ?? '');
          firstName = userAdditionalData['first_name'] ?? '';
          lastName = userAdditionalData['last_name'] ?? '';
          userType = responseData['data']['user']['user_type'] ?? '';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ubah Kata Sandi'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 16),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: Color(0xFF6EBF45),
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                  radius: 30.0,
                  backgroundColor: Colors.white,
                  onBackgroundImageError: (exception, stackTrace) {
                    setState(() {
                      imageUrl = '';
                    });
                  },
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$firstName $lastName',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      userType,
                      style: TextStyle(
                        color: Color(0xFFD7D7D7),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 1.2,
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Classic', // Anda dapat mengganti teks ini sesuai dengan data yang sebenarnya
                        style: TextStyle(
                          color: Color(0xFF6EBF45),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 1.2,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Email',
            style: TextStyle(
              color: Color(0xFF181D27),
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 5),
          Container(
            height: 40,
            decoration: ShapeDecoration(
              color: Color(0xFFF4F4F4),
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Color(0xFF6EBF45)),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'No Telepon',
            style: TextStyle(
              color: Color(0xFF181D27),
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 5),
          Container(
            height: 40,
            decoration: ShapeDecoration(
              color: Color(0xFFF4F4F4),
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Color(0xFF6EBF45)),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Kata Sandi ',
            style: TextStyle(
              color: Color(0xFF181D27),
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 5),
          Container(
            height: 40,
            decoration: ShapeDecoration(
              color: Color(0xFFF4F4F4),
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Color(0xFF6EBF45)),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Tambahkan logika untuk tombol "Perbarui" di sini
            },
            child: Text(
              'Perbarui',
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  Color(0xFF6EBF45), // Mengatur warna latar belakang tombol
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class EditPasswordApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bFARM',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: EditPassword(),
    );
  }
}
