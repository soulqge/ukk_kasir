import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ukk_kasir/pages/kasir/cashier.dart';
import 'package:ukk_kasir/pages/kasir/checklist.dart';

class PrintNotaPage extends StatelessWidget {
  final String cashierName;
  final int tableNumber;
  final List<OrderItem> orderList;
  final int totalAmount;
  final int taxAmount;
  final int grandTotal;

  const PrintNotaPage({
    Key? key,
    required this.cashierName,
    required this.tableNumber,
    required this.orderList,
    required this.totalAmount,
    required this.taxAmount,
    required this.grandTotal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(92, 92, 91, 1),
        title: Text(
          "Print Nota",
          style: GoogleFonts.inter(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage()
              ),
            );
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
          children: [
            Spacer(),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.black),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Wikusama Cafe",
                            style: GoogleFonts.inter(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("Cashier	:",
                                    style: GoogleFonts.inter(fontSize: 16)),
                                SizedBox(width: 10),
                                Text(cashierName,
                                    style: GoogleFonts.inter(
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Text("Date	:",
                                    style: GoogleFonts.inter(fontSize: 16)),
                                SizedBox(width: 10),
                                Text(formattedDate,
                                    style: GoogleFonts.inter(
                                        fontWeight: FontWeight.bold)),
                              ],
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("No Table",
                                style: GoogleFonts.inter(fontSize: 16)),
                            Text(tableNumber.toString(),
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                    Divider(),
                    Text("Order",
                        style: GoogleFonts.inter(
                            fontSize: 17, fontWeight: FontWeight.bold)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...orderList.map((item) {
                          final itemTotal = item.item.price * item.quantity;
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  "${item.item.name} (${item.quantity})",
                                  style: GoogleFonts.inter(fontSize: 16),
                                ),
                              ),
                              Text(
                                "IDR $itemTotal",
                                style: GoogleFonts.inter(fontSize: 16),
                              ),
                            ],
                          );
                        }).toList(),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total",
                            style: GoogleFonts.inter(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Text("IDR $totalAmount",
                            style: GoogleFonts.inter(fontSize: 16)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Tax (10%)",
                            style: GoogleFonts.inter(fontSize: 16)),
                        Text("IDR $taxAmount",
                            style: GoogleFonts.inter(fontSize: 16)),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Grand Total",
                            style: GoogleFonts.inter(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Text("IDR $grandTotal",
                            style: GoogleFonts.inter(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
