import 'package:flutter/material.dart';
import 'pembayaran.dart'; // Import Pembayaran widget
import 'pembelian_alat.dart';

void main() {
  runApp(const DetailPesanan(selectedItems: 0));
}

class DetailPesanan extends StatelessWidget {
  final int selectedItems;

  const DetailPesanan({Key? key, required this.selectedItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: DetailPesananScreen(selectedItems: selectedItems),
    );
  }
}

class DetailPesananScreen extends StatefulWidget {
  final int selectedItems;

  const DetailPesananScreen({Key? key, required this.selectedItems})
      : super(key: key);

  @override
  _DetailPesananScreenState createState() => _DetailPesananScreenState();
}

class _DetailPesananScreenState extends State<DetailPesananScreen> {
  late int selectedItems;

  @override
  void initState() {
    super.initState();
    selectedItems = widget.selectedItems;
  }

  int getTotalPrice() {
    return 60000 *
        selectedItems; // Modify 60000 as per the actual price per item
  }

  void _incrementCounter() {
    setState(() {
      selectedItems++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (selectedItems > 0) {
        selectedItems--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Detail Pesanan',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Beranda()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/perusahaan.png',
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'PT. Lima Benua Koneksindo, Surabaya',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const Icon(Icons.location_on,
                              size: 16, color: Colors.red),
                          const SizedBox(width: 4),
                          const Text(
                            'xxxxx',
                            style: TextStyle(
                              color: Color(0xFF616161),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          const Spacer(),
                          const Icon(Icons.navigate_next,
                              size: 24, color: Color(0xFF404040)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Daftar Pesanan',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton.icon(
                  onPressed: () {
                    Navigator.popUntil(context, ModalRoute.withName('/'));
                  },
                  icon: const Icon(Icons.add, color: Color(0xFF6EBF45)),
                  label: const Text(
                    'Tambah Pesanan',
                    style: TextStyle(
                      color: Color(0xFF6EBF45),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Image.asset(
                  'assets/images/ProductAlat.png',
                  height: 80,
                  width: 70,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Alat XXX',
                        style: TextStyle(
                          color: Color(0xFF0A0A0A),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Qty : $selectedItems',
                        style: const TextStyle(
                          color: Color(0xFF616161),
                          fontSize: 10,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Rp. ${getTotalPrice()}',
                        style: const TextStyle(
                          color: Color(0xFF6EBF45),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: _decrementCounter,
                  child: const Icon(Icons.remove),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6EBF45),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '$selectedItems',
                  style: const TextStyle(
                    color: Color(0xFF9E9E9E),
                    fontSize: 10,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _incrementCounter,
                  child: const Icon(Icons.add),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6EBF45),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Data Pemesan',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton.icon(
                  onPressed: () {
                    Navigator.popUntil(context, ModalRoute.withName('/'));
                  },
                  icon:
                      const Icon(Icons.change_circle, color: Color(0xFF6EBF45)),
                  label: const Text(
                    'Ubah',
                    style: TextStyle(
                      color: Color(0xFF6EBF45),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
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
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Rp ${getTotalPrice()}',
                          style: const TextStyle(
                            color: Color(0xFF6EBF45),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Termasuk Biaya Layanan dan Pajak',
                          style: TextStyle(
                            color: Color(0xFF9E9E9E),
                            fontSize: 9,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300,
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
                            builder: (context) => PembayaranScreen(
                                selectedItems:
                                    selectedItems), // Pass selectedItems
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6EBF45),
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
            ),
          ],
        ),
      ),
    );
  }
}
