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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.mobil.namaMobil),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                '${widget.mobil.foto}',
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Text(
              widget.mobil.namaMobil,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Harga: ${widget.mobil.harga}",
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
            SizedBox(height: 16),
            Text(
              "Deskripsi:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Mobil ${widget.mobil.namaMobil} adalah kendaraan yang nyaman dan cocok untuk perjalanan dalam kota maupun luar kota. "
                  "Dilengkapi dengan fitur keamanan dan kenyamanan terbaik di kelasnya.",
              style: TextStyle(fontSize: 16), textAlign: TextAlign.justify,
            ),
            Spacer(),
            // SizedBox(
            //   width: double.infinity,
            //   child: ElevatedButton(
            //     onPressed: () {
            //       //saya ingin memunculkan sebuah modal sheet dimana bisa memilih tanggal (tanggal sewa dan selesai sewa), pilih perlu supir atau tidak, Pilihan Transmisi (manual atau matic)
            //
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         SnackBar(content: Text("Penyewaan mobil ${widget.mobil.namaMobil} sedang di Proses")),
            //       );
            //     },
            //     child: Text("Sewa Sekarang", style: TextStyle(fontSize: 18)),
            //     style: ElevatedButton.styleFrom(
            //       padding: EdgeInsets.symmetric(vertical: 15),
            //     ),
            //   ),
            // ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return SingleChildScrollView(
                        child: StatefulBuilder(
                          builder: (BuildContext context, StateSetter setState) {

                            return Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // Tanggal Sewa
                                  ListTile(
                                    title: Text("Tanggal Sewa"),
                                    subtitle: Text(
                                      startDate != null
                                          ? "${startDate!.day}-${startDate!.month}-${startDate!.year}"
                                          : "Belum dipilih",
                                    ),
                                    trailing: IconButton(
                                      icon: Icon(Icons.calendar_today),
                                      onPressed: () async {
                                        DateTime? pickedDate = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime.now().add(Duration(days: 365)),
                                        );
                                        if (pickedDate != null) {
                                          setState(() {
                                            startDate = pickedDate;
                                          });
                                        }
                                      },
                                    ),
                                  ),
                                  // Tanggal Selesai Sewa
                                  ListTile(
                                    title: Text("Tanggal Selesai Sewa"),
                                    subtitle: Text(
                                      endDate != null
                                          ? "${endDate!.day}-${endDate!.month}-${endDate!.year}"
                                          : "Belum dipilih",
                                    ),
                                    trailing: IconButton(
                                      icon: Icon(Icons.calendar_today),
                                      onPressed: () async {
                                        DateTime? pickedDate = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime.now().add(Duration(days: 365)),
                                        );
                                        if (pickedDate != null) {
                                          setState(() {
                                            endDate = pickedDate;
                                          });
                                        }
                                      },
                                    ),
                                  ),
                                  // Pilihan Supir
                                  CheckboxListTile(
                                    title: Text("Perlu Supir"),
                                    value: needDriver,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        needDriver = value ?? false;
                                      });
                                    },
                                  ),
                                  // Pilihan Transmisi
                                  ListTile(
                                    title: Text("Pilihan Transmisi"),
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
                                  ),
                                  // Tombol Konfirmasi
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text("Penyewaan mobil ${widget.mobil.namaMobil} sedang di Proses")),
                                      );
                                    },
                                    child: Text("Konfirmasi"),
                                  ),
                                  SizedBox(height: 30,)
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
                child: Text("Sewa Sekarang", style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
