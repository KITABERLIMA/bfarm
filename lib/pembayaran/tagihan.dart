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
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          children: [
            Column(
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
                              selectedItems: selectedItems,
                            ),
                          ),
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
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
                    ],
                  ),
                ),
                Divider(
                  color: Color(0xFFE0E0E0),
                  height: 24,
                  thickness: 1,
                ),
                _buildInfoRow(
                  iconSize: 5,
                  iconColor: Color(0xFF616161),
                  text:
                      'Transaksi ini akan otomatis menggantikan tagihan BCA Virtual Account yang belum dibayar.',
                ),
                _buildInfoRow(
                  iconSize: 5,
                  iconColor: Color(0xFF616161),
                  text: 'Dapatkan kode pembayaran setelah klik “Bayar”.',
                ),
                _buildInfoRow(
                  iconSize: 5,
                  iconColor: Color(0xFF616161),
                  text:
                      'Tidak disarankan bayar melalui bank lain agar transaksi dapat diproses tanpa kendala.',
                ),
                SizedBox(height: 210),
                _buildBottomBar(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow({
    required double iconSize,
    required Color iconColor,
    required String text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Icon(
              Icons.circle,
              size: iconSize,
              color: iconColor,
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
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
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Container(
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
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => total_tagihan(
                      selectedItems: selectedItems,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF6EBF45),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: const Text(
                'Pilih Pembayaran',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}