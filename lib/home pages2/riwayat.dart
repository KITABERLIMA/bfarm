import 'package:flutter/material.dart';

void main() {
  runApp(RiwayatPage());
}

class RiwayatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Terbaru'),
      ),
      body: ListView.builder(
        itemCount: 4, // Jumlah entri yang ingin ditampilkan
        itemBuilder: (context, index) {
          // Ganti dengan data sebenarnya
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 2,
              color:
                  Colors.white, // Ubah warna latar belakang card menjadi putih
              shadowColor: const Color.fromARGB(
                  255, 179, 176, 176), // Ubah warna bayangan card menjadi hitam
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(color: Colors.black, width: 1.0),
              ),
              child: ListTile(
                title: Text('Lahan xxxx'),
                subtitle: Text(
                  '1 Sep 2024 - 1 Sep 2024\nLahan yang memiliki luas 1Ha yang berpetapan di gunung ...',
                ),
                trailing: ElevatedButton(
                  onPressed: () {
                    // Aksi ketika tombol ditekan
                  },
                  child: Text('Selesai'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor:
                        Colors.green, // Ubah warna teks tombol menjadi putih
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
