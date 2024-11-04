import 'package:flutter/material.dart';
import 'package:presneg/page/mobil.dart';

class DetailSewa extends StatefulWidget {
  final Mobil mobil;
  const DetailSewa({super.key, required this.mobil});

  @override
  State<DetailSewa> createState() => _DetailSewaState();
}

class _DetailSewaState extends State<DetailSewa> {
  DateTime? startDate;
  DateTime? endDate;
  bool needDriver = false;
  String transmission = 'manual';

  @override
  Widget build(BuildContext context) {
    final primaryColor = Color(0xFFa434eb); // Warna utama (ungu)

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.mobil.namaMobil),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white, // Warna teks pada AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                    12.0), // Membuat gambar memiliki sudut melengkung
                child: Image.asset(
                  '${widget.mobil.foto}',
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              widget.mobil.namaMobil,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Harga: ${widget.mobil.harga}",
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
            SizedBox(height: 16),
            Text(
              "Deskripsi:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Mobil ${widget.mobil.namaMobil} adalah kendaraan yang nyaman dan cocok untuk perjalanan dalam kota maupun luar kota. "
              "Dilengkapi dengan fitur keamanan dan kenyamanan terbaik di kelasnya.",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return SingleChildScrollView(
                        child: StatefulBuilder(
                          builder:
                              (BuildContext context, StateSetter setState) {
                            return Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                    title: Text(
                                      "Tanggal Sewa",
                                      style: TextStyle(
                                        color: primaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: Text(
                                      startDate != null
                                          ? "${startDate!.day}-${startDate!.month}-${startDate!.year}"
                                          : "Belum dipilih",
                                    ),
                                    trailing: IconButton(
                                      icon: Icon(Icons.calendar_today,
                                          color: primaryColor),
                                      onPressed: () async {
                                        DateTime? pickedDate =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime.now()
                                              .add(Duration(days: 365)),
                                        );
                                        if (pickedDate != null) {
                                          setState(() {
                                            startDate = pickedDate;
                                          });
                                        }
                                      },
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(
                                      "Tanggal Selesai Sewa",
                                      style: TextStyle(
                                        color: primaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: Text(
                                      endDate != null
                                          ? "${endDate!.day}-${endDate!.month}-${endDate!.year}"
                                          : "Belum dipilih",
                                    ),
                                    trailing: IconButton(
                                      icon: Icon(Icons.calendar_today,
                                          color: primaryColor),
                                      onPressed: () async {
                                        DateTime? pickedDate =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime.now()
                                              .add(Duration(days: 365)),
                                        );
                                        if (pickedDate != null) {
                                          setState(() {
                                            endDate = pickedDate;
                                          });
                                        }
                                      },
                                    ),
                                  ),
                                  CheckboxListTile(
                                    title: Text(
                                      "Perlu Supir",
                                      style: TextStyle(
                                        color: primaryColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    value: needDriver,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        needDriver = value ?? false;
                                      });
                                    },
                                    activeColor: primaryColor,
                                  ),
                                  ListTile(
                                    title: Text(
                                      "Pilihan Transmisi",
                                      style: TextStyle(
                                        color: primaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  RadioListTile<String>(
                                    title: Text("Manual"),
                                    value: "manual",
                                    groupValue: transmission,
                                    onChanged: (String? value) {
                                      setState(() {
                                        transmission = value!;
                                      });
                                    },
                                    activeColor: primaryColor,
                                  ),
                                  RadioListTile<String>(
                                    title: Text("Matic"),
                                    value: "matic",
                                    groupValue: transmission,
                                    onChanged: (String? value) {
                                      setState(() {
                                        transmission = value!;
                                      });
                                    },
                                    activeColor: primaryColor,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                "Penyewaan mobil ${widget.mobil.namaMobil} sedang di Proses")),
                                      );
                                    },
                                    child: Text("Konfirmasi"),
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor:
                                          primaryColor, // Warna teks putih
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
                child: Text(
                  "Sewa Sekarang",
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: primaryColor,
                  padding:
                      EdgeInsets.symmetric(vertical: 15), // Warna teks putih
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
