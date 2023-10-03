import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'Anggota/dataanggota.dart';
import 'package:kebaya_boutiq/kalender.dart';
import 'package:kebaya_boutiq/pages/absensi.dart';
import 'package:kebaya_boutiq/visimisi.dart';
import 'edit_profile.dart';
import 'keuangan/Iuran_Models.dart';
import 'keuangan/inputiuran.dart';
import 'keuangan/iuran.dart';
import 'logout_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  void onSearchPressed() {
    String searchText = searchController.text;
    // Lakukan sesuatu dengan searchText, misalnya navigasi ke hasil pencarian
    print('Searching for: $searchText');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        onTap: (int index) {
          if (index == 1) {
            // Pindah ke halaman Transaksi
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          }
        },
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 140,
                    width: double.infinity,
                    color: Color.fromARGB(255, 215, 103, 150),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Selamat Datang di Sistem PKK Desa  Kubutambahan",
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white),
                                )
                              ],
                            ),
                            Container(
                              alignment: Alignment.topRight,
                              child: Icon(
                                Icons.notifications_active,
                                color: Colors.white,
                                size: 30,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xFFF5F5F7),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: searchController,
                                  cursorHeight: 20,
                                  autofocus: false,
                                  decoration: InputDecoration(
                                    hintText: "Cari Anggota",
                                    prefixIcon: Icon(Icons.search),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 2),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  onSubmitted: (value) {
                                    onSearchPressed();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Category(
                      imagePath: "assets/team.png",
                      title: "Anggota",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AnggotaList(),
                          ),
                        );
                      },
                    ),
                    Category(
                      imagePath: "assets/passbook.png",
                      title: "Iuran",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InputIuranPage(),
                          ),
                        );
                      },
                    ),
                    Category(
                      imagePath: "assets/attendance.png",
                      title: "Absensi",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TransactionPage(),
                          ),
                        );
                      },
                    ),
                    Category(
                      imagePath: "assets/schedule.png",
                      title: "Kalender",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Calendar(
                                // catatan: '',
                                // judul: '',
                                // tanggal: null,
                                ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Kepengurusan",
                  style: GoogleFonts.montserrat(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),

              // Carousel section
              CarouselSlider(
                items: [
                  PlantShop(
                    imagePath: "assets/pkk.jpeg",
                    nameShop: "Ketua",
                    onTap: () {
                      // Navigasi ke halaman AnggotaList saat item diklik.
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AnggotaList()),
                      );
                    },
                  ),
                  PlantShop(
                    imagePath: "assets/sekretaris.jpg",
                    nameShop: "Sekretaris",
                    onTap: () {
                      // Navigasi ke halaman AnggotaList saat item diklik.
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AnggotaList()),
                      );
                    },
                  ),
                  PlantShop(
                    imagePath: "assets/PKK1.jpg",
                    nameShop: "Bendahara",
                    onTap: () {
                      // Navigasi ke halaman AnggotaList saat item diklik.
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AnggotaList()),
                      );
                    },
                  ),
                ],
                options: CarouselOptions(
                  height: 250,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  enlargeCenterPage: true,
                ),
              ),

              // Rest of your content
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 215, 103, 150),
        title: Text('Sistem PKK Desa Kubutambahan'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 215, 103, 150)),
              accountName: Text('Ni Made Budi Ayu'),
              accountEmail: Text('budiayu123@gmail.com'),
              currentAccountPicture: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyEdit()),
                  );
                },
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/logo google.png'),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.people_alt_outlined),
              title: Text(
                'Profile',
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => ProfilePage())));
              },
            ),
            ListTile(
              leading: Icon(Icons.volunteer_activism_outlined),
              title: Text(
                'Visi Misi',
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => VisiMisiPage())));
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text(
                'Logout',
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => LogoutPage())));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PlantShop extends StatelessWidget {
  final String imagePath;
  final String nameShop;
  final VoidCallback onTap;

  const PlantShop({
    Key? key,
    required this.imagePath,
    required this.nameShop,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: double.infinity,
        height: 250,
        child: Stack(
          children: [
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 10,
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 10,
              child: SizedBox(
                height: 30,
                child: Column(
                  children: [
                    Text(
                      nameShop,
                      style: GoogleFonts.montserrat(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback? onPressed;

  const Category({
    super.key,
    required this.imagePath,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(17.0),
        child: Container(
          width: 50,
          height: 60,
          child: Column(
            children: [
              Image.asset(
                imagePath,
                width: 30,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: GoogleFonts.montserrat(fontSize: 10),
              )
            ],
          ),
        ),
      ),
    );
  }
}
