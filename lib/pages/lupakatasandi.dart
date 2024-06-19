import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'periksaemail.dart';
import 'login.dart';

void main() {
  runApp(Lupakatasandi());
}

class Lupakatasandi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
              );
            },
          ),
          title: Text('Lupa Kata Sandi'), // Menambahkan judul ke AppBar
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ResetPasswordForm(), // Diubah menjadi widget stateful
            ),
          ),
        ),
      ),
    );
  }
}

class ResetPasswordForm extends StatefulWidget {
  @override
  _ResetPasswordFormState createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  Future<void> _resetPassword() async {
    final String apiUrl = 'http://bfarm.ahmadyaz.my.id/api/resendOtpCode';
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': _emailController.text}),
    );

    if (response.statusCode == 200) {
      // Navigate to the next page if the API call is successful
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PeriksaEmail(
                  email: _emailController.text, // Pass the email correctly
                )),
      );
    } else {
      // Show an error message if the API call fails
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Gagal mengirim permintaan. Silakan coba lagi.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20), // Add some space between the app bar and texts
          Text(
            'Lupa Kata Sandi',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              fontFamily: 'Poppins',
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Masukkan email Anda untuk mengatur ulang kata sandi',
            style: TextStyle(
              fontFamily: 'Poppins',
            ),
          ),
          SizedBox(
              height:
                  20), // Add some space between the texts and the "Your Email" text
          Text(
            'Your Email',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              fontFamily: 'Poppins',
            ),
          ),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: Colors.green),
            ),
            padding: EdgeInsets.only(left: 10),
            child: TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Email',
                border: InputBorder.none,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Email tidak boleh kosong';
                }
                if (!RegExp(r'^[^@]+@[^@]+.[^@]+').hasMatch(value)) {
                  return 'Masukkan email yang valid';
                }
                return null;
              },
            ),
          ),
          SizedBox(
              height:
                  20), // Add some space between the text field and the button
          Container(
            width: double.infinity, // Make the button take the full width
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  _resetPassword();
                }
              },
              child: Text(
                'Reset Kata Sandi',
                style: TextStyle(
                  color: Colors.white, // Set text color to white
                  fontFamily: 'Poppins', // Set to Poppins font
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
