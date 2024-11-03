import 'package:flutter/material.dart';
import 'package:presneg/page/detailSewa.dart';
import 'package:presneg/page/mobil.dart';

class Sewa extends StatefulWidget {
  const Sewa({super.key});

  @override
  State<Sewa> createState() => _SewaState();
}

class _SewaState extends State<Sewa> {
  List<Mobil> listMobil = [
    Mobil(
        foto: "assets/images/Toyota_Avanza.png",
        namaMobil: "Toyota Avanza",
        harga: "Rp 350.000 / hari"),
    Mobil(
        foto: "assets/images/Toyota_Calya.png",
        namaMobil: "Toyota Calya",
        harga: "Rp 300.000 / hari"),
    Mobil(
        foto: "assets/images/Honda_Brio.png",
        namaMobil: "Honda Brio",
        harga: "Rp 300.000 / hari"),
    Mobil(
        foto: "assets/images/Mitsubishi_Xpander.png",
        namaMobil: "Mitsubishi Xpander",
        harga: "Rp 400.000 / hari"),
    Mobil(
        foto: "assets/images/Daihatsu_Xenia.png",
        namaMobil: "Daihatsu Xenia",
        harga: "Rp 350.000 / hari"),
    Mobil(
        foto: "assets/images/Daihatsu_Ayla.png",
        namaMobil: "Daihatsu Ayla",
        harga: "Rp 250.000 / hari"),
    Mobil(
        foto: "assets/images/Daihatsu_Sigra.png",
        namaMobil: "Daihatsu Sigra",
        harga: "Rp 250.000 / hari"),
    Mobil(
        foto: "assets/images/Toyota_Agya.png",
        namaMobil: "Toyota Agya",
        harga: "Rp 250.000 / hari"),
    Mobil(
        foto: "assets/images/Suzuki_Ertiga.png",
        namaMobil: "Suzuki Ertiga",
        harga: "Rp 330.000 / hari"),
    Mobil(
        foto: "assets/images/Toyota_Innova.png",
        namaMobil: "Toyota Innova",
        harga: "Rp 450.000 / hari"),
  ];

  List<Mobil> displayedMobil = [];

  @override
  void initState() {
    super.initState();
    displayedMobil = listMobil;
  }

  void _filterMobil(String query) {
    final results = listMobil
        .where((mobil) =>
            mobil.namaMobil.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      displayedMobil = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cari Mobil"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (query) => _filterMobil(query),
              decoration: InputDecoration(
                labelText: 'Cari Mobil',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 3 / 2,
              ),
              itemCount: displayedMobil.length,
              itemBuilder: (context, index) {
                final mobil = displayedMobil[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DetailSewa(mobil: mobil,)));
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Image.asset(
                          '${mobil.foto}',
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                mobil.namaMobil,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(mobil.harga),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
