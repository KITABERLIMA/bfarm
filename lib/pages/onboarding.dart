import 'dart:async';
import 'package:flutter/material.dart';
import '../pages/login.dart';

void main() {
  runApp(BFarm());
}

class BFarm extends StatefulWidget {
  @override
  _BFarmState createState() => _BFarmState();
}

class _BFarmState extends State<BFarm> {
  final PageController controller = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 7), () {
      if (mounted) {
        setState(() {
          controller.animateToPage(1,
              duration: Duration(milliseconds: 600), curve: Curves.ease);
        });
      }
    });
    controller.addListener(() {
      setState(() {
        _currentPage = controller.page!.round();
      });

      // Prevent sliding back from slide 2 to slide 1
      if (_currentPage == 1 && controller.page! < 1.0) {
        controller.jumpToPage(1);
      }
    });
  }

  void _goToNextPage() {
    if (_currentPage < 3) {
      controller.animateToPage(_currentPage + 1,
          duration: Duration(milliseconds: 800), curve: Curves.easeInOut);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                PageView(
                  controller: controller,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: <Widget>[
                    buildSlide1(constraints),
                    buildSlide2(constraints),
                    buildSlide3(constraints),
                    buildSlide4(constraints),
                  ],
                ),
                if (_currentPage !=
                    0) // Tampilkan indikator kecuali halaman pertama
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 350,
                    bottom: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 1; i <= 3; i++) // Mulai dari halaman 2
                          _buildPageIndicator(i == _currentPage),
                      ],
                    ),
                  ),
                if (_currentPage !=
                    0) // Tampilkan tombol hanya di halaman selain pertama
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
                        onPressed: _goToNextPage,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: constraints.maxHeight * 0.01),
                          child: Text(
                            'Lanjut',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF6EBF45),
                              fontSize: constraints.maxWidth * 0.04,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                if (_currentPage != 0)
                  Positioned(
                    top: constraints.maxHeight * 0.01,
                    left: constraints.maxWidth * 0.01,
                    child: ClipRRect(
                      child: Image.asset(
                        'assets/images/14.png',
                        width: constraints.maxWidth * 0.3,
                        height: constraints.maxHeight * 0.15,
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildPageIndicator(bool isActive) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: 8.0,
      width: isActive ? 24.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.green : Colors.grey,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  Widget buildSlide1(BoxConstraints constraints) {
    return Container(
      color: Colors.white,
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
          child: Image.asset(
            'assets/images/open.gif',
            width: constraints.maxWidth * 0.5,
            height: constraints.maxHeight * 0.5,
          ),
        ),
      ),
    );
  }

  Widget buildSlide2(BoxConstraints constraints) {
    return Container(
      color: Colors.white,
      child: Stack(
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
                          fontSize: constraints.maxWidth * 0.05,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: constraints.maxHeight * 0.02),
                      SizedBox(
                        width: constraints.maxWidth * 0.85,
                        child: Text(
                          'Kenali jenis tanah untuk memahami karakteristik dan potensi pertaniannya.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: constraints.maxWidth * 0.035,
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
        ],
      ),
    );
  }

  Widget buildSlide3(BoxConstraints constraints) {
    return Container(
      color: Colors.white,
      child: Stack(
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
                          fontSize: constraints.maxWidth * 0.05,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: constraints.maxHeight * 0.02),
                      SizedBox(
                        width: constraints.maxWidth * 0.85,
                        child: Text(
                          'Pilih tanaman yang sesuai dengan jenis tanah untuk memastikan pertumbuhan yang optimal.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: constraints.maxWidth * 0.035,
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
        ],
      ),
    );
  }

  Widget buildSlide4(BoxConstraints constraints) {
    return Container(
      color: Colors.white,
      child: Stack(
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
                child: Container(
                  decoration: ShapeDecoration(
                    color: Colors.black.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0xBF000000),
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    'assets/images/6.png',
                    fit: BoxFit.cover,
                  ),
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
                          fontSize: constraints.maxWidth * 0.05,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: constraints.maxHeight * 0.02),
                      SizedBox(
                        width: constraints.maxWidth * 0.85,
                        child: Text(
                          'Pilihlah pupuk yang cocok dengan jenis tanah dan tanaman untuk memaksimalkan pertumbuhan dan hasil panen.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: constraints.maxWidth * 0.035,
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
        ],
      ),
    );
  }
}
