import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ukk_kasir/components/order_row.dart';
import 'package:ukk_kasir/pages/kasir/histori_transaksi.dart';
import 'package:ukk_kasir/pages/login/login.dart';
import 'package:ukk_kasir/pages/manager/laporan_keuangan.dart';

class HomeManager extends StatefulWidget {
  const HomeManager({super.key});

  @override
  State<HomeManager> createState() => _HomeManagerState();
}

class _HomeManagerState extends State<HomeManager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 235,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/welcome.png'),
                  colorFilter: ColorFilter.linearToSrgbGamma(),
                  fit: BoxFit.cover, // Makes the image cover the whole screen
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  // Top bar with clock and logout icons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Welcome!',
                        style: GoogleFonts.inter(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _showLogoutDialog(
                              context); // Calls the logout dialog function
                        },
                        child:
                            Icon(Icons.logout, size: 30, color: Colors.white),
                      ),
                    ],
                  ),
                  // Subtext with name
                  Text(
                    'Manager - Arif.',
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(color: Colors.white)),
                          backgroundColor: Color.fromRGBO(92, 91, 91, 1),
                          foregroundColor: Colors.white),
                      onPressed: () {
                        Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LaporanKeuanganPage()
                      ),
                    );
                      },
                      child: Text("Lihat Laporan Keuangan")),
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    'Employees',
                    style: GoogleFonts.inter(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Header Row
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          children: [
                            Expanded(
                              child: Center(
                                child: Text(
                                  "ID",
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  "Name",
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  "Table",
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  "Date",
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  "Status",
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                          height: 10),
                      OrderRow(
                          id: "12",
                          name: "Orang",
                          table: "6",
                          bill: "17/06/\n2024",
                          status: "Lunas"),
                      OrderRow(
                          id: "22",
                          name: "Orang",
                          table: "2",
                          bill: "17/06/\n2024",
                          status: "Belum"),
                      OrderRow(
                          id: "121",
                          name: "Orang",
                          table: "1",
                          bill: "17/06/\n2024",
                          status: "Belum"),
                      OrderRow(
                          id: "122",
                          name: "Orang",
                          table: "10",
                          bill: "17/06/\n2024",
                          status: "Lunas"),
                      OrderRow(
                          id: "123",
                          name: "Orang",
                          table: "8",
                          bill: "17/06/\n2024",
                          status: "Lunas"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

void _showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          "Confirm Logout",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Text(
          "Are you sure you want to log out?",
          style: TextStyle(fontSize: 22),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text(
              "Cancel",
              style: TextStyle(fontSize: 20),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
                (Route<dynamic> route) =>
                    false, // Ini akan menghapus semua halaman sebelumnya
              );
            },
            child: Text("Logout", style: TextStyle(fontSize: 20)),
          ),
        ],
      );
    },
  );
}
