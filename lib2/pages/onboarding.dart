import 'dart:async';
import 'package:bfarm_mobileapp/pages/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BFarm());
}

class BFarm extends StatefulWidget {
  @override
  _BFarmState createState() => _BFarmState();
}

class _BFarmState extends State<BFarm> {
  final PageController controller = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          controller.animateToPage(1,
              duration: Duration(milliseconds: 600), curve: Curves.ease);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            return PageView(
              controller: controller,
              children: <Widget>[
                Container(
                    color: Colors.grey[100], child: buildSlide1(constraints)),
                Container(
                    color: Colors.grey[100], child: buildSlide2(constraints)),
                Container(
                    color: Colors.grey[100], child: buildSlide3(constraints)),
                Container(
                    color: Colors.grey[100], child: buildSlide4(constraints)),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget buildSlide1(BoxConstraints constraints) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Image.asset('assets/images/1.png', fit: BoxFit.cover),
          ),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
              child: Image.asset(
                'assets/images/2.png',
                width: constraints.maxWidth * 0.5,
                height: constraints.maxHeight * 0.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSlide2(BoxConstraints constraints) {
    return Stack(
      children: [
        Positioned.fill(
          bottom: constraints.maxHeight * 0.1,
          child: Padding(
            padding: EdgeInsets.only(bottom: constraints.maxHeight * 0.1),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
              child: Image.asset(
                'assets/images/3.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Kenali Jenis Tanah',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: constraints.maxWidth * 0.85,
                      child: Text(
                        'Kenali jenis tanah untuk memahami karakteristik dan potensi pertaniannya.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: constraints.maxHeight * 0.005,
          left: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsets.only(bottom: constraints.maxHeight * 0.005),
            child: SizedBox(
              width: constraints.maxWidth * 0.8,
              child: Text(
                'KNOW MORE GROW MORE WITH FARM',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  fontWeight: FontWeight.w100,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: constraints.maxHeight * 0.08,
          left: constraints.maxWidth * 0.25,
          right: constraints.maxWidth * 0.25,
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 2, color: Color(0xFF6EBF45)),
                borderRadius: BorderRadius.circular(25),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )
              ],
            ),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.transparent, // Set primary color to transparent
                elevation: 0, // Remove elevation
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 10), // Sesuaikan padding dengan kebutuhan Anda
                child: Text(
                  'Lanjut',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF6EBF45),
                    fontSize: 16, // Sesuaikan fontSize dengan kebutuhan Anda
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: constraints.maxHeight * 0.01,
          left: constraints.maxWidth * 0.01,
          child: ClipRRect(
            child: Image.asset(
              'assets/images/5.png',
              width: constraints.maxWidth * 0.3,
              height: constraints.maxHeight * 0.15,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildSlide3(BoxConstraints constraints) {
    return Stack(
      children: [
        Positioned.fill(
          bottom: constraints.maxHeight * 0.1,
          child: Padding(
            padding: EdgeInsets.only(bottom: constraints.maxHeight * 0.1),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
              child: Image.asset(
                'assets/images/4.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Pilih Tanaman',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: constraints.maxWidth * 0.85,
                      child: Text(
                        'Pilih tanaman yang sesuai dengan jenis tanah untuk memastikan pertumbuhan yang optimal.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: constraints.maxHeight * 0.005,
          left: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsets.only(bottom: constraints.maxHeight * 0.005),
            child: SizedBox(
              width: constraints.maxWidth * 0.8,
              child: Text(
                'KNOW MORE GROW MORE WITH FARM',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  fontWeight: FontWeight.w100,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: constraints.maxHeight * 0.08,
          left: constraints.maxWidth * 0.25,
          right: constraints.maxWidth * 0.25,
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 2, color: Color(0xFF6EBF45)),
                borderRadius: BorderRadius.circular(25),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )
              ],
            ),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.transparent, // Set primary color to transparent
                elevation: 0, // Remove elevation
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 10), // Sesuaikan padding dengan kebutuhan Anda
                child: Text(
                  'Lanjut',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF6EBF45),
                    fontSize: 16, // Sesuaikan fontSize dengan kebutuhan Anda
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: constraints.maxHeight * 0.01,
          left: constraints.maxWidth * 0.01,
          child: ClipRRect(
            child: Image.asset(
              'assets/images/5.png',
              width: constraints.maxWidth * 0.3,
              height: constraints.maxHeight * 0.15,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildSlide4(BoxConstraints constraints) {
    return Stack(
      children: [
        Positioned.fill(
          bottom: constraints.maxHeight * 0.1,
          child: Padding(
            padding: EdgeInsets.only(bottom: constraints.maxHeight * 0.1),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
              child: Image.asset(
                'assets/images/6.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Pilih Pupuk',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: constraints.maxWidth * 0.85,
                      child: Text(
                        'Pilihlah pupuk yang cocok dengan jenis tanah dan tanaman untuk memaksimalkan pertumbuhan dan hasil panen.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: constraints.maxHeight * 0.005,
          left: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsets.only(bottom: constraints.maxHeight * 0.005),
            child: SizedBox(
              width: constraints.maxWidth * 0.8,
              child: Text(
                'KNOW MORE GROW MORE WITH FARM',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  fontWeight: FontWeight.w100,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: constraints.maxHeight * 0.08,
          left: constraints.maxWidth * 0.25,
          right: constraints.maxWidth * 0.25,
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 2, color: Color(0xFF6EBF45)),
                borderRadius: BorderRadius.circular(25),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )
              ],
            ),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.transparent, // Set primary color to transparent
                elevation: 0, // Remove elevation
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 10), // Sesuaikan padding dengan kebutuhan Anda
                child: Text(
                  'Lanjut',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF6EBF45),
                    fontSize: 16, // Sesuaikan fontSize dengan kebutuhan Anda
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: constraints.maxHeight * 0.01,
          left: constraints.maxWidth * 0.01,
          child: ClipRRect(
            child: Image.asset(
              'assets/images/5.png',
              width: constraints.maxWidth * 0.3,
              height: constraints.maxHeight * 0.15,
            ),
          ),
        ),
      ],
    );
  }
}
