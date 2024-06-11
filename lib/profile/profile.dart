import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../bantuan_dukungan/bantuan_dukungan.dart';
import '../edit/edit_password.dart';
import '../edit/edit_personal.dart';
import '../pages/kebijakan_privasi.dart';
import '../pages/ketentuan_layanan.dart';
import '../pages/tentang_aplikasi.dart';

void main() {
  runApp(Profile());
}

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
      // Handle the case where token is not available
      setState(() {
        userType = 'Token not found';
      });
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
        var userData = responseData['data']['user'];
        var userAdditionalData = responseData['data']['user_additional_data'];
        var userImage = responseData['data']['user_image'];
        setState(() {
          imageUrl =
              'http://bfarm.ahmadyaz.my.id/users/' + (userImage['image'] ?? '');
          firstName = userAdditionalData['first_name'] ?? '';
          lastName = userAdditionalData['last_name'] ?? '';
          userType = userData['user_type'] ?? '';
        });
      } else {
        setState(() {
          userType = 'Data not found';
        });
      }
    } else {
      setState(() {
        userType = 'Failed to load data';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFF4F4F4),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 38),
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
                      onBackgroundImageError: (exception, stackTrace) {
                        setState(() {
                          imageUrl =
                              ''; // Reset imageUrl if the image fails to load
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
                            'Classic',
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
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Pengaturan Akun',
                  style: TextStyle(
                    color: Color(0xFF121212),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 1.0,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              buildSettingItem(
                title: 'Profil',
                subtitle: 'Buat perubahan pada akun Anda',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditPersonal(),
                    ),
                  );
                },
                icon: Icons.account_circle,
              ),
              buildSettingItem(
                title: 'Kata Sandi',
                subtitle: 'Manage your device security',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditPassword(),
                    ),
                  );
                },
                icon: Icons.lock,
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Pengaturan Aplikasi',
                  style: TextStyle(
                    color: Color(0xFF121212),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 1.0,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 5),
              buildSettingItem(
                title: 'Bantuan dan Dukungan',
                subtitle:
                    'Dapatkan bantuan dan dukungan mengenai penggunaan aplikasi',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BantuanDukungan(),
                    ),
                  );
                },
                icon: Icons.notifications,
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Tentang bFarm',
                  style: TextStyle(
                    color: Color(0xFF121212),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 1.0,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              buildSettingItem(
                title: 'Syarat dan Ketentuan',
                subtitle:
                    'Temukan panduan lengkap tentang penggunaan layanan kami',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => KetentuanLayananScreen(),
                    ),
                  );
                },
                icon: Icons.description,
              ),
              buildSettingItem(
                title: 'Kebijakan Privasi',
                subtitle:
                    'Temukan informasi tentang bagaimana kami melindungi data Anda',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => KebijakanPrivasiScreen(),
                    ),
                  );
                },
                icon: Icons.privacy_tip,
              ),
              buildSettingItem(
                title: 'Tentang Aplikasi',
                subtitle:
                    'Temukan lebih banyak tentang aplikasi kami dan visi kami dalam mengubah industri',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TentangApk(),
                    ),
                  );
                },
                icon: Icons.info,
              ),
              SizedBox(height: 20),
              buildSettingItem(
                title: 'Keluar',
                onTap: () {
                  // Tambahkan logika untuk aksi ketika kotak diklik
                },
                subtitle: '',
                icon: Icons.exit_to_app,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSettingItem({
    required String title,
    required String subtitle,
    required Function onTap,
    required IconData icon,
  }) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Icon(icon), // Menampilkan ikon di sini
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Color(0xFF181D27),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0.8,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Color(0xFFABABAB),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 1.1,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Opacity(
                opacity: 0.05,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: ShapeDecoration(
                    color: Color(0xFF6EBF45),
                    shape: OvalBorder(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
