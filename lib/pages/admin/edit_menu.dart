import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ukk_kasir/pages/admin/tambah_menu_page.dart';
import 'package:ukk_kasir/style/styles.dart';

class MenuUI extends StatefulWidget {
  const MenuUI({super.key});

  @override
  State<MenuUI> createState() => _MenuUIState();
}

class _MenuUIState extends State<MenuUI> {
  List<Map<String, dynamic>> manageMeja = [
    {
      "nama": "Burger",
      "harga": 15000,
      "jenis": "Makanan",
      "image": "assets/images/Minuman1.png"
    },
    {
      "nama": "Pizza",
      "harga": 25000,
      "jenis": "Makanan",
      "image": "assets/images/Minuman1.png"
    },
    {
      "nama": "Pasta",
      "harga": 20000,
      "jenis": "Makanan",
      "image": "assets/images/Minuman1.png"
    },
    {
      "nama": "Nasi Goreng",
      "harga": 18000,
      "jenis": "Makanan",
      "image": "assets/images/Minuman1.png"
    },
    {
      "nama": "Es Teh",
      "harga": 5000,
      "jenis": "Minuman",
      "image": "assets/images/Minuman1.png"
    },
    {
      "nama": "Es Jeruk",
      "harga": 7000,
      "jenis": "Minuman",
      "image": "assets/images/Minuman1.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Menu', style: TextStyle(color: Colors.white)),
        backgroundColor: Styles.themeColor,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: manageMeja.length,
        itemBuilder: (context, index) {
          final menu = manageMeja[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Card(
              color: Styles.themeColor,
              elevation: 4,
              child: ListTile(
                leading: Image.asset(
                  menu["image"],
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(
                  menu["nama"],
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${menu["harga"]}",
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Jenis: ${menu["jenis"]}",
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TambahMenuPage()),
          );
        },
        backgroundColor: Styles.themeColor,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
