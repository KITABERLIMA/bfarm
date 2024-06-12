import 'package:flutter/material.dart';
import 'package:bfarm_mobileapp/pembayaran/pembelian_alat.dart';
import 'tagihan.dart';

class DetailPemesanan extends StatelessWidget {
  final int totalAmount;

  const DetailPemesanan({Key? key, required this.totalAmount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Icon2(),
          AdditionalContent(),
          DataPemesan(),
          Detailharga(totalAmount: totalAmount),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Container(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Beranda()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6EBF45),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Pesan Lagi',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Icon2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const int itemPrice = 60000; // Harga per item
    int qty = (context
                .findAncestorWidgetOfExactType<DetailPemesanan>()
                ?.totalAmount ??
            0) ~/
        itemPrice;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context); // Go back to the previous screen
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                'Detail Pesanan',
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
        Padding(
          padding: const EdgeInsets.only(left: 8, top: 16, right: 24),
          child: Row(
            children: [
              SizedBox(
                height: 80,
                width: 80,
                child: Image.asset('assets/images/perusahaan.png',
                    fit: BoxFit.cover),
              ),
              const SizedBox(width: 16), // Added SizedBox for spacing
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'PT. Lima Benua Koneksindo, Surabaya',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 16,
                          color: Colors.red,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            'xxxxx',
                            style: TextStyle(
                              color: Color(0xFF616161),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.navigate_next,
                          size: 24,
                          color: Color(0xFF404040),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Daftar Pesanan',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            SizedBox(
              height: 80,
              width: 90,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16), // Tambahkan padding di sebelah kanan gambar
                child: Image.asset(
                  'assets/images/ProductAlat.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 32), // Added SizedBox for spacing
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
                    'Qty : $qty',
                    style: const TextStyle(
                      color: Color(0xFF616161),
                      fontSize: 10,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Rp. ${itemPrice * qty}',
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
      ],
    );
  }
}

// Dummy widgets for AdditionalContent and DataPemesan
class AdditionalContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 35),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'BCA Virtual Account',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Spacer(),
          Image.asset(
            "assets/images/Bank.png",
            width: 40,
            height: 40,
          ),
        ],
      ),
    );
  }
}

class DataPemesan extends StatelessWidget {
  const DataPemesan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 35),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(2),
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Data Pemesan',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            children: [
              InfoRow(
                label: 'Nama',
                value: 'Shinta',
              ),
              SizedBox(height: 20),
              InfoRow(
                label: 'Alamat',
                value: 'Jl. Gunung Anyar Jaya',
              ),
              SizedBox(height: 20),
              InfoRow(
                label: 'Nomor Telepon',
                value: '+628 7730384030',
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
        const Divider(
          color: Color(0xFFE0E0E0),
          height: 1,
          thickness: 1,
          indent: 35,
          endIndent: 35,
        ),
      ],
    );
  }
}

class Detailharga extends StatelessWidget {
  final int totalAmount;

  const Detailharga({Key? key, required this.totalAmount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 35),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(2),
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Detail Harga',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            children: [
              InfoRow(
                label: 'Sub Total',
                value: 'Rp. $totalAmount',
              ),
              SizedBox(height: 20),
              InfoRow(
                label: 'Biaya Layanan',
                value: 'Rp.0',
              ),
              SizedBox(height: 20),
              InfoRow(
                label: 'Harga Total',
                value: 'Rp. $totalAmount',
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const InfoRow({Key? key, required this.label, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
