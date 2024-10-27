import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ukk_kasir/components/admin/form_box_user.dart';
import 'package:ukk_kasir/components/admin/password_input.dart';

class TambahUserPage extends StatefulWidget {
  const TambahUserPage({super.key});

  @override
  State<TambahUserPage> createState() => _TambahUserPageState();
}

class _TambahUserPageState extends State<TambahUserPage> {
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
            Text(
              "Wikusama Cafe",
              style: GoogleFonts.inter(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 43),
            FormBoxUser(label: "Username", hint: "Username"),
            SizedBox(height: 22),
            FormBoxUser(label: "Email", hint: "youremail@gmail.com"),
            SizedBox(height: 22),
            PasswordInput(),
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
                _buildRoleButton("User"),
                _buildRoleButton("Admin"),
                _buildRoleButton("Manager"),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print("Selected Role: $_selectedRole");
              },
              style: ElevatedButton.styleFrom(
                side: BorderSide(
                  color: Colors.black
                ),
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
              child: Text(
                "Buat Akun",
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
        backgroundColor: _selectedRole == role ? Colors.grey[200] : Colors.white,
        side: BorderSide(
          color: _selectedRole == role ? Color.fromRGBO(92, 91, 91, 1) : Colors.black,
        ),
      ),
      child: Text(
        role,
        style: GoogleFonts.inter(
          fontSize: 16,
          color: Colors.black,
          fontWeight: _selectedRole == role ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
