import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DetailPesanan extends StatefulWidget {
  const DetailPesanan({super.key});

  @override
  State<DetailPesanan> createState() => _DetailPesananState();
}

class _DetailPesananState extends State<DetailPesanan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          'Status Penyewaan',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Nama Mobil
            _buildDetailSection(
              title: 'Mobil yang Disewa:',
              value: "Toyota Avanza",
            ),

            _buildDetailSection(
              title: 'Tanggal Mulai Sewa:',
              value: '12-11-2024',
            ),

            // Tanggal Sewa
            _buildDetailSection(
              title: 'Tanggal Selesai Sewa:',
              value: '18-11-2024',
            ),

            // Status
            _buildDetailSection(
              title: 'Status:',
              value: 'Menunggu Proses',
              valueColor: Colors.orange,
            ),

            SizedBox(height: 32),

            // Tombol Chat
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Fungsi untuk tombol chat
                  _openChat();
                },
                child: Text("Chat", style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  backgroundColor: Colors.deepPurple,
                  textStyle: TextStyle(fontSize: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membuat detail section
  Widget _buildDetailSection({
    required String title,
    required String value,
    Color valueColor = Colors.black,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(fontSize: 16, color: valueColor),
          ),
        ],
      ),
    );
  }

  void _openChat() async {
    final String phone = '6281258791424';
    final String message = Uri.encodeComponent("Halo, saya ingin bertanya tentang penyewaan mobil.");
    final Uri url = Uri.parse("https://wa.me/$phone?text=$message");

    try {
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        throw 'Could not launch $url';
      }
    } catch (e) {
      print('Could not launch $url: $e');
    }
  }

}
