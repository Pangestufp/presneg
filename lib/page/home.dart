import 'package:flutter/material.dart';

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
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text(
          'Beranda',
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
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.search, color: Colors.white),
                    hintText: 'Cari Mobil',
                    hintStyle: const TextStyle(color: Colors.white),
                    labelStyle: const TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide:
                      const BorderSide(color: Colors.white, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide:
                      const BorderSide(color: Colors.white, width: 1),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide:
                      const BorderSide(color: Colors.white, width: 1),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide:
                      const BorderSide(color: Colors.white, width: 1),
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
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.car_rental_outlined), label: "Booking"),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_rounded), label: "Account"),
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
