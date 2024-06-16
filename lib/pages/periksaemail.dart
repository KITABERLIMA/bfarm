import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../home pages/Dashboard.dart';

void main() {
  runApp(MaterialApp(
    home: PeriksaEmail(email: 'example@example.com'),
  ));
}

class PeriksaEmail extends StatefulWidget {
  final String email;

  PeriksaEmail({required this.email});

  @override
  _PeriksaEmailState createState() => _PeriksaEmailState();
}

class _PeriksaEmailState extends State<PeriksaEmail> {
  final List<TextEditingController> _otpControllers =
      List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());
  bool _isResendOtpLoading = false;
  bool _obscureText1 = true;
  bool _obscureText2 = true;

  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isUpdating = false;

  @override
  void dispose() {
    // Dispose controllers and focus nodes
    _otpControllers.forEach((controller) => controller.dispose());
    _focusNodes.forEach((focusNode) => focusNode.dispose());
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _confirmResetPassword() async {
    setState(() {
      _isUpdating = true;
    });

    String otpCode =
        _otpControllers.map((controller) => controller.text).join();
    String newPassword = _newPasswordController.text;
    String confirmPassword = _confirmPasswordController.text;
    String email = widget.email;

    final response = await http.post(
      Uri.parse('http://bfarm.ahmadyaz.my.id/api/confirmResetPassword'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'otp_code': otpCode,
        'new_password': newPassword,
        'confirm_password': confirmPassword,
        'email': email,
      }),
    );

    setState(() {
      _isUpdating = false;
    });

    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Dashboard()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Gagal memperbarui kata sandi ${response.body}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Periksa Email Anda'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Periksa Email Anda',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 6),
              Text(
                'Kami telah mengirimkan tautan reset ke email ${widget.email}. Silakan masukkan kode enam digit yang disebutkan dalam email.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(6, (index) => _buildOtpBox(index)),
              ),
              SizedBox(height: 20),
              Text(
                'Kata Sandi',
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
                  controller: _newPasswordController,
                  obscureText: _obscureText1,
                  decoration: InputDecoration(
                    hintText: 'Masukkan Kata Sandi Baru Anda',
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      icon: _obscureText1
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _obscureText1 = !_obscureText1;
                        });
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Konfirmasi Kata Sandi',
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
                  controller: _confirmPasswordController,
                  obscureText: _obscureText2,
                  decoration: InputDecoration(
                    hintText: 'Masukkan Kembali Kata Sandi',
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      icon: _obscureText2
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _obscureText2 = !_obscureText2;
                        });
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isUpdating ? null : _confirmResetPassword,
                  child: _isUpdating
                      ? CircularProgressIndicator()
                      : Text(
                          'Perbarui Kata Sandi',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                          ),
                        ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: _isResendOtpLoading ? null : _resendOtp,
                child: _isResendOtpLoading
                    ? CircularProgressIndicator()
                    : Text('Belum menerima email? Kirim ulang email'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOtpBox(int index) {
    return Container(
      width: 40,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: _otpControllers[index],
        focusNode: _focusNodes[index],
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: InputBorder.none,
          counterText: '', // Hides the character counter
        ),
        keyboardType: TextInputType.number,
        maxLength: 1,
        onChanged: (value) {
          if (value.length == 1 && index < 5) {
            FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
          } else if (value.isEmpty && index > 0) {
            FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
          }
        },
      ),
    );
  }

  void _resendOtp() {
    setState(() {
      _isResendOtpLoading = true;
    });

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isResendOtpLoading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Email terkirim ulang')));
    });
  }
}
