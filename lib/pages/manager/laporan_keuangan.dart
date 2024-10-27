import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LaporanKeuanganPage extends StatelessWidget {
  final List<Map<String, dynamic>> transactions = [
    {"name": "Kopi Cucu", "quantity": 10, "price": 1000, "image": "assets/images/Minuman1.png"},
    {"name": "Kopi Cucu", "quantity": 10, "price": 1000, "image": "assets/images/Minuman1.png"},
    {"name": "Kopi Cucu", "quantity": 10, "price": 1000, "image": "assets/images/Minuman1.png"},
    {"name": "Kopi Cucu", "quantity": 10, "price": 1000, "image": "assets/images/Minuman1.png"},
    {"name": "Kopi Cucu", "quantity": 10, "price": 1000, "image": "assets/images/Minuman1.png"},
    {"name": "Kopi Cucu", "quantity": 10, "price": 1000, "image": "assets/images/Minuman1.png"},
  ];

  @override
  Widget build(BuildContext context) {
    int totalIncome = transactions.fold(0, (int sum, Map<String, dynamic> item) => sum + (item['price'] as int));


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(92, 92, 91, 1),
        title: Text(
          "Laporan Keuangan",
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "17/06/2024",
              style: GoogleFonts.sora(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final transaction = transactions[index];
                  return Card(
                    elevation: 2,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              transaction['image'],
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  transaction['name'],
                                  style: GoogleFonts.sora(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Total terjual: ${transaction['quantity']}",
                                  style: GoogleFonts.sora(fontSize: 12, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "IDR ${transaction['price']}",
                            style: GoogleFonts.sora(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(27, 174, 118, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Card(
              elevation: 2,
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total pemasukkan:",
                      style: GoogleFonts.sora(fontSize: 16),
                    ),
                    Text(
                      "IDR $totalIncome",
                      style: GoogleFonts.sora(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(27, 174, 118, 1),
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
