import 'dart:convert';
import '/../home pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'daftarsebagai.dart';
import 'kebijakan_privasi.dart';
import 'ketentuan_layanan.dart';
import 'lupakatasandi.dart'; // Import the LupaKataSandi class
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> loginUser(BuildContext context) async {
    final String apiUrl = 'http://bfarm.ahmadyaz.my.id/api/login'; //kantor
    //final String apiUrl = '192.168.1.5:8000/api/login'; //rumah
    final response = await http.post(Uri.parse(apiUrl), body: {
      'email': emailController.text,
      'password': passwordController.text,
    });

    final jsonData = json.decode(response.body);

    // Handle response here, for example, you can check the status code
    if (response.statusCode == 200) {
      // Save token to SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', jsonData['token']);

      // If login is successful, navigate to dashboard
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Dashboard()));
    } else {
      // If login fails, show error message
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Login Failed'),
            content: Text(jsonData['message'] ?? 'Unknown Error'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                  child: Text(
                    'Masuk',
                    style: TextStyle(
                      fontSize: 32,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Belum punya akun?',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DaftarSebagai()),
                            );
                          },
                          child: Text(
                            'Daftar disini',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: Colors.green),
                      ),
                      padding: EdgeInsets.only(left: 10),
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          prefixIcon: Icon(Icons.email),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: Colors.green),
                      ),
                      padding: EdgeInsets.only(left: 10),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Kata Sandi',
                          prefixIcon: Icon(Icons.lock),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {
                          // Navigate to LupaKataSandi page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Lupakatasandi(),
                            ),
                          );
                        },
                        child: Text(
                          'Lupa Kata Sandi',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        loginUser(context);
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    Text(
                      'Dengan masuk atau daftar, Anda setuju dengan',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 10.0),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => KetentuanLayananScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Ketentuan Layanan',
                            style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.green,
                            ),
                          ),
                        ),
                        Text(
                          ' dan ',
                          style: TextStyle(
                            fontSize: 10.0,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => KebijakanPrivasiScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Kebijakan Privasi',
                            style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.green,
                            ),
                          ),
                        ),
                        Text(
                          ' bFarm',
                          style: TextStyle(
                            fontSize: 10.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
