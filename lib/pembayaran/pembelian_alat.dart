import 'package:flutter/material.dart';
import 'cart_item.dart';
import 'package:provider/provider.dart';
import 'detailpesanan.dart';
import 'Produk.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => cart_item()), // Perbaiki di sini
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Beranda(),
    );
  }
}

class Beranda extends StatefulWidget {
  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: BFarm(),
              ),
              Rectangle6(
                counter: _counter,
                onCounterChanged: (value) {
                  setState(() {
                    _counter = value;
                  });
                },
              ),
              SizedBox(height: 8),
              Tabbing(),
              SizedBox(height: 15),
              Dekripsi(),
              SizedBox(height: 8),
              Recommended(),
              ButtonAddToCart(counter: _counter),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: IconBack(),
          ),
        ],
      ),
    );
  }
}

class BFarm extends StatefulWidget {
  @override
  _BFarmState createState() => _BFarmState();
}

class _BFarmState extends State<BFarm> {
  final PageController controller = PageController(initialPage: 0);
  int _currentPage = 0;
  int _totalPages = 3;

  double imageHeight = 429.0;
  double imageWidth = 310.0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          height: constraints.maxHeight,
          width: constraints.maxWidth,
          child: Stack(
            children: [
              PageView(
                controller: controller,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: <Widget>[
                  buildSlide('assets/images/alat.png'),
                  buildSlide('assets/images/alat.png'),
                  buildSlide('assets/images/alat.png'),
                ],
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 24.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicators(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<Widget> _buildPageIndicators() {
    List<Widget> indicators = [];
    for (int i = 0; i < _totalPages; i++) {
      indicators.add(
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0),
          child: Container(
            width: 8.0,
            height: 8.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentPage == i ? Colors.green : Colors.grey,
            ),
          ),
        ),
      );
    }
    return indicators;
  }

  Widget buildSlide(String imagePath) {
    return Container(
      color: Colors.white,
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
        height: imageHeight,
        width: imageWidth,
      ),
    );
  }
}

class IconBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: 0,
      child: Container(
        width: 36.59,
        height: 32,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class Rectangle6 extends StatefulWidget {
  final int counter;
  final ValueChanged<int> onCounterChanged;

  const Rectangle6({
    Key? key,
    required this.counter,
    required this.onCounterChanged,
  }) : super(key: key);

  @override
  _Rectangle6State createState() => _Rectangle6State();
}

class _Rectangle6State extends State<Rectangle6> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Alat XXXX',
                      style: TextStyle(
                        color: Color(0xFF121212),
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 0,
                        letterSpacing: 0.10,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Rp. 6.000.000',
                      style: TextStyle(
                        color: Color(0xFF6EBF45),
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.10,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (widget.counter > 0) {
                          widget.onCounterChanged(widget.counter - 1);
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: Colors.green,
                            width: 2,
                          ),
                        ),
                        child: Icon(
                          Icons.remove,
                          color: Colors.green,
                          size: 24,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      child: Text(
                        '${widget.counter}',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        widget.onCounterChanged(widget.counter + 1);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: Colors.green,
                            width: 2,
                          ),
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.green,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Tabbing extends StatefulWidget {
  @override
  _TabbingState createState() => _TabbingState();
}

class _TabbingState extends State<Tabbing> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      child: Row(
        children: [
          buildTab(context, "Deskripsi", index: 0),
          buildTab(context, "Produk", index: 1),
        ],
      ),
    );
  }

  Widget buildTab(BuildContext context, String title, {required int index}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: TextButton(
          onPressed: () {
            setState(() {
              _selectedIndex = index;
            });
            switch (index) {
              case 0:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Dekripsi()),
                );
                break;
              case 1:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Produk()),
                );
                break;
              default:
                break;
            }
          },
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed) ||
                    _selectedIndex == index) {
                  return Color(0x306EBF45);
                } else {
                  return Colors.transparent;
                }
              },
            ),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: _selectedIndex == index
                  ? Color(0xFF6EBF45)
                  : Color(0xFFAAAAAA),
              fontSize: 16,
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ),
    );
  }
}

class Dekripsi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          SizedBox(
            width: 750,
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consectetur velit at massa vehicula, quis fringilla urna gravida.',
              style: TextStyle(
                color: Color(0xFFAAAAAA),
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Recommended extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          RecommendedItem(),
          SizedBox(width: 20),
          RecommendedItem(),
          SizedBox(width: 20),
          RecommendedItem(),
        ],
      ),
    );
  }
}

class RecommendedItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      height: 256,
      padding: EdgeInsets.only(right: 20.0),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 48,
            child: Container(
              width: 260,
              height: 208,
              child: Stack(
                children: [
                  Positioned(
                    left: 30.62,
                    top: 0,
                    child: Container(
                      width: 179.51,
                      height: 208,
                      child: Column(
                        children: [
                          Container(
                            width: 179.51,
                            height: 155,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x19202020),
                                  blurRadius: 50,
                                  offset: Offset(0, 4),
                                  spreadRadius: -5,
                                )
                              ],
                            ),
                            child: Image.asset('assets/images/alat.png'),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Rp 3-.000',
                            style: TextStyle(
                              color: Color(0xFF121212),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.07,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Alat XXX',
                            style: TextStyle(
                              color: Color(0xFFAAAAAA),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.06,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonAddToCart extends StatelessWidget {
  final int
      counter; // Tambahkan parameter untuk menyimpan nilai jumlah item yang dipilih

  const ButtonAddToCart({Key? key, required this.counter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartItem = Provider.of<cart_item>(context);

    return GestureDetector(
      onTap: counter >
              0 // Ubah kondisi untuk mengaktifkan tombol hanya ketika jumlah item lebih besar dari 0
          ? () {
              // Simpan jumlah item yang dipilih saat tombol diklik
              int selectedItems =
                  counter; // Ubah agar menyimpan nilai dari parameter counter

              // Navigasi ke halaman DetailPesanan dan kirimkan parameter selectedItems
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetailPesanan(selectedItems: selectedItems),
                ),
              );
            }
          : null,
      child: Container(
        width: 428.78,
        height: 75,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: counter > 0
                      ? Color(0xFF6EBF45)
                      : Colors.grey, // Ubah kondisi untuk warna tombol
                  borderRadius: BorderRadius.circular(0),
                ),
                child: Center(
                  child: Text(
                    'Tambahkan ke keranjang',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.07,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
