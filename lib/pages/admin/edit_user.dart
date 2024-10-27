import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ukk_kasir/pages/admin/tambah_user.dart';
import 'package:ukk_kasir/style/styles.dart';

class UserUI extends StatelessWidget {
  final List<Map<String, String>> users = List.generate(
    5,
    (index) => {
      "role": "Kasir",
      "name": "Arif Lest",
      "email": "user${index + 1}@gmail.com",
      "pass": "12345678",
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.themeColor,
        title: Text(
          "Manage User",
          style: GoogleFonts.inter(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Table headers
            Container(
              color: Colors.grey[800],
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildHeaderCell("Role"),
                  _buildHeaderCell("Name"),
                  _buildHeaderCell("Email"),
                  _buildHeaderCell("Pass"),
                  _buildHeaderCell("Status"),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildDataCell(user["role"]!),
                        _buildDataCell(user["name"]!),
                        _buildDataCell(user["email"]!),
                        _buildDataCell(user["pass"]!),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            // Add delete functionality here
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TambahUserPage()
                          ),
                        );
              },
              backgroundColor: Styles.themeColor,
              foregroundColor: Colors.white,
              child: Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCell(String title) {
    return Expanded(
      child: Center(
        child: Text(
          title,
          style: GoogleFonts.inter(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildDataCell(String data) {
    return Expanded(
      child: Center(
        child: Text(
          data,
          style: GoogleFonts.inter(
            fontSize: 10,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
