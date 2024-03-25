import 'package:flutter/material.dart';

void main() {
  runApp(const EditPersonal());
}

class EditPersonal extends StatelessWidget {
  const EditPersonal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                EditIndivu(),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Action for update button
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF6EBF45),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Perbarui',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EditIndivu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        Center(
          child: Stack(
            children: [
              Container(
                width: 382,
                height: 104,
                decoration: ShapeDecoration(
                  color: Color(0xFF6EBF45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
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
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      // Tambahkan logika untuk mengganti gambar profil saat di tap
                      // Misalnya, buka dialog atau halaman khusus untuk mengunggah gambar baru
                      // atau panggil fetchProfileImage lagi untuk mengambil gambar baru dari API
                    },
                    child: CircleAvatar(
                      radius: 30, // Ukuran gambar profil
                      backgroundImage: AssetImage(
                          'path_to_your_image'), // Ganti dengan path gambar atau asset yang sebenarnya
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        Text(
          'Nama Depan',
          style: TextStyle(
            color: Color(0xFF181D27),
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          height: 40,
          decoration: ShapeDecoration(
            color: Color(0xFFF4F4F4),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Color(0xFF6EBF45)),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: TextFormField(
            // Add text editing controller and API data here
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
        ),
        Text(
          'Nama Belakang',
          style: TextStyle(
            color: Color(0xFF181D27),
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
        Text(
          'Email',
          style: TextStyle(
            color: Color(0xFF181D27),
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          height: 40,
          decoration: ShapeDecoration(
            color: Color(0xFFF4F4F4),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Color(0xFF6EBF45)),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: TextFormField(
            // Add text editing controller and API data here
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
        ),
        Text(
          'Nomor Telepon',
          style: TextStyle(
            color: Color(0xFF181D27),
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          height: 40,
          decoration: ShapeDecoration(
            color: Color(0xFFF4F4F4),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Color(0xFF6EBF45)),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: TextFormField(
            // Add text editing controller and API data here
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
        ),
        Text(
          'Alamat',
          style: TextStyle(
            color: Color(0xFF181D27),
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          height: 40,
          decoration: ShapeDecoration(
            color: Color(0xFFF4F4F4),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Color(0xFF6EBF45)),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: TextFormField(
            // Add text editing controller and API data here
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
        ),
        Text(
          'Provinsi',
          style: TextStyle(
            color: Color(0xFF181D27),
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          height: 40,
          decoration: ShapeDecoration(
            color: Color(0xFFF4F4F4),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Color(0xFF6EBF45)),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: TextFormField(
            // Add text editing controller and API data here
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
        ),
        Text(
          'Kabupaten/Kota',
          style: TextStyle(
            color: Color(0xFF181D27),
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          height: 40,
          decoration: ShapeDecoration(
            color: Color(0xFFF4F4F4),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Color(0xFF6EBF45)),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: TextFormField(
            // Add text editing controller and API data here
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
        ),
        Text(
          'Kecamatan',
          style: TextStyle(
            color: Color(0xFF181D27),
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          height: 40,
          decoration: ShapeDecoration(
            color: Color(0xFFF4F4F4),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Color(0xFF6EBF45)),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: TextFormField(
            // Add text editing controller and API data here
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
        ),
        Text(
          'Kelurahan/Desa',
          style: TextStyle(
            color: Color(0xFF181D27),
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          height: 40,
          decoration: ShapeDecoration(
            color: Color(0xFFF4F4F4),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Color(0xFF6EBF45)),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: TextFormField(
            // Add text editing controller and API data here
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
        ),
      ],
    );
  }
}
