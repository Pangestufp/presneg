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
        iconTheme: IconThemeData(
          color: Colors.white, // Ubah warna ikon menjadi putih
        ),
        backgroundColor: Color(0xFFa434eb),
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextField(
            onChanged: (query) => _filterMobil(query),
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 0),
              hintText: 'Cari Mobil',
              hintStyle: TextStyle(color: Colors.white70),
              filled: true,
              fillColor: Colors.white.withOpacity(0.1),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none,
              ),
              prefixIcon: Icon(Icons.search, color: Colors.white),
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFa434eb), Color(0xFFe2c7fa)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 3 / 4,
          ),
          itemCount: displayedMobil.length,
          itemBuilder: (context, index) {
            final mobil = displayedMobil[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailSewa(mobil: mobil)),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 5,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                      child: Image.asset(
                        mobil.foto,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            mobil.namaMobil,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.deepPurple,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            mobil.harga,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                            ),
                          ),
                          SizedBox(height: 8),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFa434eb),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailSewa(mobil: mobil),
                                ),
                              );
                            },
                            child: Text(
                              'Detail',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
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
    );
  }

}
