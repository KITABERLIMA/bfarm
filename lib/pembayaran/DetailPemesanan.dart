import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Added import
import 'dart:convert'; // Added import
import 'package:http/http.dart' as http;
import 'package:bfarm_mobileapp/pembayaran/pembelian_alat.dart';

class DetailPemesanan extends StatefulWidget {
  final int totalAmount;

  const DetailPemesanan({Key? key, required this.totalAmount})
      : super(key: key);

  @override
  _DetailPemesananState createState() => _DetailPemesananState();
}

class _DetailPemesananState extends State<DetailPemesanan> {
  String firstName = '';
  String fullAddress = '';
  String phone = '';
  String village = '';
  String sub_district = '';
  String city_district = '';
  String province = '';
  String postal_code = '';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      // Handle the case where token is not available
      setState(() {
        firstName = 'Token not found';
      });
      return;
    }

    final response = await http.get(
      Uri.parse('http://bfarm.ahmadyaz.my.id/api/users'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      if (responseData.containsKey('data')) {
        var userAdditionalData = responseData['data']['user_additional_data'];
        var address = responseData['data']['address'];

        setState(() {
          firstName = userAdditionalData['first_name'] ?? '';
          fullAddress = address['full_address'] ?? '';
          phone = userAdditionalData['phone'] ?? '';
          village = address['village'] ?? '';
          sub_district = address['sub_district'] ?? '';
          city_district = address['city_district'] ?? '';
          province = address['province'] ?? '';
          postal_code = address['postal_code'] ?? '';
        });
      } else {
        setState(() {
          firstName = 'Data not found';
        });
      }
    } else {
      setState(() {
        firstName = 'Failed to load data';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Icon2(
            fullAddress: fullAddress,
            village: village,
            sub_district: sub_district,
            city_district: city_district,
            province: province,
            postal_code: postal_code,
            totalAmount: widget.totalAmount,
          ),
          AdditionalContent(),
          DataPemesan(
            firstName: firstName,
            fullAddress: fullAddress,
            phone: phone,
          ),
          Detailharga(totalAmount: widget.totalAmount),
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
  final String fullAddress;
  final String village;
  final String sub_district;
  final String city_district;
  final String province;
  final String postal_code;
  final int totalAmount;

  const Icon2({
    Key? key,
    required this.fullAddress,
    required this.village,
    required this.sub_district,
    required this.city_district,
    required this.province,
    required this.postal_code,
    required this.totalAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int itemPrice = 60000; // Harga per item
    int qty = totalAmount ~/ itemPrice;

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
                      fullAddress,
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
                            '${village}, ${sub_district}, ${city_district}, ${province}, ${postal_code}',
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
                padding: const EdgeInsets.only(left: 16),
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
  final String firstName;
  final String fullAddress;
  final String phone;

  const DataPemesan({
    Key? key,
    required this.firstName,
    required this.fullAddress,
    required this.phone,
  }) : super(key: key);

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
                value: firstName,
              ),
              SizedBox(height: 20),
              InfoRow(
                label: 'Alamat',
                value: fullAddress,
              ),
              SizedBox(height: 20),
              InfoRow(
                label: 'Nomor Telepon',
                value: phone,
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