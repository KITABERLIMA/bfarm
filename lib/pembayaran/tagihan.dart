import 'package:flutter/material.dart';
import 'pembayaran.dart';
import 'DetailPemesanan.dart';
import 'total_tagihan.dart';

void main() {
  runApp(const Tagihan(selectedItems: 0));
}

class Tagihan extends StatelessWidget {
  final int selectedItems;

  const Tagihan({Key? key, required this.selectedItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PembayaranScreen(
                                    selectedItems: selectedItems)),
                          );
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
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
                  SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total Tagihan',
                              style: TextStyle(
                                color: Color(0xFF616161),
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Rp. ${60000 * selectedItems}',
                              style: TextStyle(
                                color: Color(0xFF6EBF45),
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPemesanan(),
                              ),
                            );
                          },
                          child: Text(
                            'Detail',
                            style: TextStyle(
                              color: Color(0xFF2CB6B6),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20), // Jarak antara konten
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 35),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  SizedBox(
                      height:
                          4), // Jarak antara konten BCA Virtual Account dan pemisah
                  Divider(
                    color: Color(0xFFE0E0E0),
                    height: 1,
                    thickness: 3,
                    indent: 35,
                    endIndent: 35,
                  ),
                  SizedBox(
                      height: 0), // Jarak antara pemisah dan konten di bawahnya
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 35),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 12),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 2),
                              child: Icon(
                                Icons.circle,
                                size: 5,
                                color: Color(0xFF616161),
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'Transaksi ini akan otomatis menggantikan tagihan BCA Virtual Account yang belum dibayar.',
                                style: TextStyle(
                                  color: Color(0xFF616161),
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 2),
                              child: Icon(
                                Icons.circle,
                                size: 5,
                                color: Color(0xFF616161),
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'Dapatkan kode pembayaran setelah klik “Bayar”.',
                                style: TextStyle(
                                  color: Color(0xFF616161),
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 2),
                              child: Icon(
                                Icons.circle,
                                size: 5,
                                color: Color(0xFF616161),
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'Tidak disarankan bayar melalui bank lain agar transaksi dapat diproses tanpa kendala.',
                                style: TextStyle(
                                  color: Color(0xFF616161),
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 210),
                        Container(
                          width: double.infinity,
                          height: 84,
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x19000000),
                                blurRadius: 20,
                                offset: Offset(0, -6),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
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
                                      "Total $selectedItems item",
                                      style: TextStyle(
                                        color: Color(0xFF616161),
                                        fontSize: 10,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w200,
                                        height: 1.0,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'Rp. ${60000 * selectedItems}',
                                      style: TextStyle(
                                        color: Color(0xFF6EBF45),
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        height: 1.0,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
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
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => total_tagihan(
                                            selectedItems:
                                                selectedItems), // Pass selectedItems
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFF6EBF45),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  child: Text(
                                    'Pilih Pembayaran',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: -0.08,
                                      decoration: TextDecoration.none,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
