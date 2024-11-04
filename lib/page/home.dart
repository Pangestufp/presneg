import 'package:flutter/material.dart';
import 'package:presneg/page/detailPesanan.dart';
import 'package:presneg/page/mobil.dart';
import 'package:presneg/page/sewa.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selecIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selecIndex = index;
    });

    // Anda bisa menambahkan logika di sini untuk navigasi berdasarkan item yang dipilih
    print("Item yang dipilih: $index");
  }

  void changePage(int pageIndex) {
    // Tambahkan logika navigasi atau perubahan halaman di sini
    print("Navigasi ke halaman $pageIndex");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF540780),
        title: _selecIndex == 0
            ? Text(
                'Beranda',
                style: TextStyle(fontSize: 30, color: Colors.white),
              )
            : Text(
                'Pesanan',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
        centerTitle: true,
        leading: const Icon(
          Icons.more_horiz,
          size: 50,
          color: Colors.white,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFa434eb), Color(0x10a434eb)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: _selecIndex == 0
            ? SingleChildScrollView(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              suffixIcon:
                                  const Icon(Icons.search, color: Colors.white),
                              hintText: 'Cari Mobil',
                              hintStyle: const TextStyle(color: Colors.white),
                              labelStyle: const TextStyle(color: Colors.white),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 1),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 1),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 1),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    changePage(1);
                                  },
                                  child: Card(
                                    color: Colors.deepPurpleAccent,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Sewa()));
                                        },
                                        child: Container(
                                          height: 60,
                                          width: 70,
                                          child: Column(
                                            children: const [
                                              Icon(
                                                Icons.car_rental,
                                                color: Colors.white,
                                                size: 40,
                                              ),
                                              Text(
                                                "Sewa Mobil",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    changePage(3);
                                  },
                                  child: Card(
                                    color: Colors.deepPurpleAccent,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 60,
                                        width: 70,
                                        child: Column(
                                          children: const [
                                            Icon(
                                              Icons.discount,
                                              color: Colors.white,
                                              size: 40,
                                            ),
                                            Text(
                                              "Promo",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    changePage(2);
                                  },
                                  child: Card(
                                    color: Colors.deepPurpleAccent,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 60,
                                        width: 70,
                                        child: Column(
                                          children: const [
                                            Icon(
                                              Icons.list,
                                              color: Colors.white,
                                              size: 40,
                                            ),
                                            Text(
                                              "Daftar Mobil",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 40),
                            const Text(
                              "Promo Spesial !!!",
                              style: TextStyle(
                                color: Colors.deepPurpleAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Image.asset(
                              'assets/images/RENTAL MOBIL.png',
                              height: 150,
                            ),
                            const SizedBox(height: 20),
                            Image.asset(
                              'assets/images/RENTAL MOBIL 2.png',
                              height: 150,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : Container(
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // posisi shadow
                      ),
                    ],
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      ListTile(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        leading: CircleAvatar(
                          backgroundColor: Colors.deepPurpleAccent,
                          child: Icon(Icons.bookmark, color: Colors.white),
                        ),
                        title: Text(
                          "Pesanan",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        subtitle: Text(
                          "Toyota Avanza",
                          style:
                              TextStyle(color: Colors.grey[600], fontSize: 14),
                        ),
                        trailing: Icon(
                          Icons.hourglass_top,
                          color: Colors.deepPurple,
                        ),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPesanan()));
                        },
                        tileColor: Colors.grey[100],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.car_rental_outlined), label: "Booking"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded), label: "Account"),
        ],
        currentIndex: _selecIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.deepPurpleAccent,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }
}
