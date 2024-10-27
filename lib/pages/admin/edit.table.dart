import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ukk_kasir/style/styles.dart';

class TableUI extends StatefulWidget {
  const TableUI({super.key});

  @override
  _TableUIState createState() => _TableUIState();
}

class _TableUIState extends State<TableUI> {
  List<Map<String, dynamic>> manageMeja = [
    {"no": "1", "status": "Tersedia", "image": "assets/images/Minuman1.png"},
    {"no": "2", "status": "Tersedia", "image": "assets/images/Minuman1.png"},
    {"no": "3", "status": "Tersedia", "image": "assets/images/Minuman1.png"},
    {"no": "4", "status": "Terisi", "image": "assets/images/Minuman1.png"},
    {"no": "5", "status": "Tersedia", "image": "assets/images/Minuman1.png"},
    {"no": "6", "status": "Terisi", "image": "assets/images/Minuman1.png"},
  ];

  void _addNewTable() {
    setState(() {
      int newTableNumber = manageMeja.length + 1;
      manageMeja.add({
        "no": "$newTableNumber",
        "status": "Tersedia",
        "image": "assets/images/Minuman1.png",
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.themeColor,
        title: Text(
          "Manage Table",
          style: GoogleFonts.inter(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: manageMeja.length,
              itemBuilder: (context, index) {
                final table = manageMeja[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Card(
                    color: Styles.themeColor,
                    elevation: 4,
                    child: ListTile(
                      leading: Image.asset(
                        table["image"],
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        "Table ${table["no"]}",
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Tersedia",
                                style: GoogleFonts.inter(
                                  fontSize: 10,
                                  color: table["status"] == "Tersedia"
                                      ? Color.fromRGBO(24, 254, 59, 1)
                                      : Colors.white,
                                ),
                              ),
                              Expanded(child: Container()),
                              Icon(
                                table["status"] == "Tersedia"
                                    ? Icons.check_circle
                                    : Icons.check_circle_outline,
                                color: Colors.white,
                                size: 16,
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                "Terisi",
                                style: GoogleFonts.inter(
                                  fontSize: 10,
                                  color: table["status"] == "Terisi"
                                      ? Color.fromRGBO(229, 6, 6, 1)
                                      : Colors.white,
                                ),
                              ),
                              Expanded(child: Container()),
                              Icon(
                                table["status"] == "Terisi"
                                    ? Icons.check_circle
                                    : Icons.check_circle_outline,
                                color: Colors.white,
                                size: 16,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewTable,
        backgroundColor: Styles.themeColor,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
      ),
    );
  }
}
