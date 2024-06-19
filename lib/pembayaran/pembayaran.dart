import 'package:flutter/material.dart';
import 'tagihan.dart';

void main() {
  runApp(const Pembayaran());
}

class Pembayaran extends StatelessWidget {
  const Pembayaran({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
      ),
      home:
          const PembayaranScreen(selectedItems: 0), // Default value for testing
    );
  }
}

class PembayaranScreen extends StatelessWidget {
  final int selectedItems;

  const PembayaranScreen({Key? key, required this.selectedItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Icon2(selectedItems: selectedItems),
        ],
      ),
    );
  }
}

class Icon2 extends StatelessWidget {
  final int selectedItems;

  const Icon2({Key? key, required this.selectedItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 8),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context); // Go back to the previous screen
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              const Text(
                'Pembayaran',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total Pembayaran',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Text(
                    'Rp. ${60000 * selectedItems}', // Calculate total price
                    style: const TextStyle(
                      color: Color(0xFF6EBF45),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0.11,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                'Pembayaran Instan',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  decoration: TextDecoration.none,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x198F9AA0),
                      blurRadius: 24,
                      offset: Offset(4, 8),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Row(
                  children: [
                    SizedBox(width: 16),
                    Container(
                      width: 40.44,
                      height: 32,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/logo gopay.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Text(
                      'Gopay',
                      style: TextStyle(
                        color: Color(0xFF1E2022),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '15 m',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFF828282),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 16),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x198F9AA0),
                      blurRadius: 24,
                      offset: Offset(4, 8),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Row(
                  children: [
                    SizedBox(width: 16),
                    Container(
                      width: 40.44,
                      height: 32,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/Ovo.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Text(
                      'OVO',
                      style: TextStyle(
                        color: Color(0xFF1E2022),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '15 m',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFF828282),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 16),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x198F9AA0),
                      blurRadius: 24,
                      offset: Offset(4, 8),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Row(
                  children: [
                    SizedBox(width: 16),
                    Container(
                      width: 39.61,
                      height: 30,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/Shopeepay.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Text(
                      'ShopeePay',
                      style: TextStyle(
                        color: Color(0xFF1E2022),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '15 m',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFF828282),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 16),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Transfer Bank',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  decoration: TextDecoration.none,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x198F9AA0),
                      blurRadius: 24,
                      offset: Offset(4, 8),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Row(
                  children: [
                    SizedBox(width: 16),
                    Container(
                      width: 43.49,
                      height: 14,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/Bank.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Text(
                      'BCA Transfer',
                      style: TextStyle(
                        color: Color(0xFF1E2022),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '1 j 30 m',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFF828282),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 16),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x198F9AA0),
                      blurRadius: 24,
                      offset: Offset(4, 8),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Row(
                  children: [
                    SizedBox(width: 16),
                    Container(
                      width: 46.08,
                      height: 14.56,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/Mandiri.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Text(
                      'Mandiri Transfer',
                      style: TextStyle(
                        color: Color(0xFF1E2022),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '1 j 30 m',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFF828282),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x198F9AA0),
                      blurRadius: 24,
                      offset: Offset(4, 8),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Row(
                  children: [
                    SizedBox(width: 16),
                    Container(
                      width: 45.96,
                      height: 12,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/BNI.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Text(
                      'BNI Transfer',
                      style: TextStyle(
                        color: Color(0xFF1E2022),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '1 j 30 m',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFF828282),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 84,
                padding: const EdgeInsets.all(14),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 157,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total $selectedItems item',
                            style: const TextStyle(
                              color: Color(0xFF616161),
                              fontSize: 10,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w200,
                              height: 1.0,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Rp ${60000 * selectedItems}', // Calculate total price
                            style: const TextStyle(
                              color: Color(0xFF6EBF45),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              height: 1.0,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Termasuk Biaya Layanan dan Pajak',
                            style: TextStyle(
                              color: Color(0xFF9E9E9E),
                              fontSize: 9,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w300,
                              height: 1.0,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      flex: 3,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Tagihan(
                                  selectedItems:
                                      selectedItems), // Navigate to the Tagihan page
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF6EBF45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: const Text(
                            'Pilih Pembayaran',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
