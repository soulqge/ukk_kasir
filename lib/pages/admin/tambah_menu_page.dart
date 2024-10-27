import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ukk_kasir/components/admin/form_box_user.dart';
import 'package:ukk_kasir/style/styles.dart';

class TambahMenuPage extends StatefulWidget {
  const TambahMenuPage({super.key});

  @override
  State<TambahMenuPage> createState() => _TambahMenuPageState();
}

class _TambahMenuPageState extends State<TambahMenuPage> {
  String _selectedRole = "User";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(92, 92, 91, 1),
        title: Text(
          "Add User",
          style: GoogleFonts.inter(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Styles.themeColor),
                      borderRadius: BorderRadius.circular(12)),
                  child: Icon(
                    Icons.add,
                    color: Styles.themeColor,
                    size: 100,
                  )),
            ),
            SizedBox(height: 8),
            Text("Upload Image",
                style: GoogleFonts.poppins(
                    fontSize: 12, fontWeight: FontWeight.bold)),
            SizedBox(height: 43),
            FormBoxUser(label: "Nama", hint: "Masukkan Nama Makanan"),
            SizedBox(height: 22),
            FormBoxUser(label: "Harga", hint: "Masukkan Harga Makanan"),
            SizedBox(height: 20),
            Text(
              "Choose Role:",
              style: GoogleFonts.inter(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildRoleButton("Makanan"),
                _buildRoleButton("Minuman"),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print("Selected Role: $_selectedRole");
              },
              style: ElevatedButton.styleFrom(
                  side: BorderSide(color: Colors.black),
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Text(
                "Tambah Menu",
                style: GoogleFonts.inter(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoleButton(String role) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          _selectedRole = role;
        });
      },
      style: OutlinedButton.styleFrom(
        backgroundColor:
            _selectedRole == role ? Colors.grey[200] : Colors.white,
        side: BorderSide(
          color: _selectedRole == role
              ? Color.fromRGBO(92, 91, 91, 1)
              : Colors.black,
        ),
      ),
      child: Text(
        role,
        style: GoogleFonts.inter(
          fontSize: 16,
          color: Colors.black,
          fontWeight:
              _selectedRole == role ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
