import 'package:flutter/material.dart';
import 'buat_kata_sandi_baru.dart';

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

  @override
  void dispose() {
    // Dispose controllers and focus nodes
    _otpControllers.forEach((controller) => controller.dispose());
    _focusNodes.forEach((focusNode) => focusNode.dispose());
    super.dispose();
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
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BuatKataSandiBaru()),
                );
              },
              child: Text(
                'Verifikasi Kode',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
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
