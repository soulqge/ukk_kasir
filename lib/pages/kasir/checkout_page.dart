import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ukk_kasir/components/kasir/button_checkout.dart';
import 'package:ukk_kasir/pages/kasir/checklist.dart';
import 'package:ukk_kasir/pages/kasir/print_nota.dart';

class CheckoutPage extends StatelessWidget {
  final String cashierName;
  final int tableNumber;
  final List<OrderItem> orderList;
  final int totalAmount;
  final double taxRate; // Add a tax rate field (e.g., 0.1 for 10% tax)

  const CheckoutPage({
    Key? key,
    required this.cashierName,
    required this.tableNumber,
    required this.orderList,
    required this.totalAmount,
    this.taxRate = 0.1, // Default tax rate of 10%
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());

    // Calculate tax and grand total
    final taxAmount = (totalAmount * taxRate).round();
    final grandTotal = totalAmount + taxAmount;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(92, 92, 91, 1),
        title: Text(
          "Checkout Order",
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black, width: 5),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "Wikusama Cafe",
                        style: GoogleFonts.inter(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Kasir:",
                              style: GoogleFonts.inter(fontSize: 17),
                            ),
                            Text(
                              cashierName,
                              style: GoogleFonts.inter(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Date :",
                              style: GoogleFonts.inter(
                                  fontStyle: FontStyle.italic, fontSize: 17),
                            ),
                            Text(
                              formattedDate,
                              style: GoogleFonts.inter(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          "No. Table:",
                          style: GoogleFonts.inter(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              border: Border.all(color: Colors.black)),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Text(tableNumber.toString()),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Order",
                      style: GoogleFonts.inter(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...orderList.map((item) {
                          final itemTotal = item.item.price * item.quantity;
                          return Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "${item.item.name} (${item.quantity})",
                                  style: GoogleFonts.inter(fontSize: 16),
                                ),
                              ),
                              Text(
                                "${itemTotal}",
                                style: GoogleFonts.inter(fontSize: 16),
                              ),
                            ],
                          );
                        }).toList(),
                        Row(
                          children: [
                            Text(
                              "PPN (10%)",
                              style: GoogleFonts.inter(
                                fontSize: 17,
                              ),
                            ),
                            Expanded(child: Container()),
                            Text("$taxAmount",
                                style: GoogleFonts.inter(fontSize: 16))
                          ],
                        ),
                      ],
                    ),
                    Divider(),
                    Text(
                      "Total: IDR $totalAmount",
                      style: GoogleFonts.inter(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    Divider(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Text("Confirm Payments?",
                style: GoogleFonts.inter(
                    fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonCheckout(
                  title: 'Cancel',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(width: 17),
                ButtonCheckout(
                  title: 'Print',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PrintNotaPage(
                          cashierName: cashierName,
                          tableNumber: tableNumber,
                          orderList: orderList,
                          totalAmount: totalAmount,
                          taxAmount: taxAmount,
                          grandTotal: grandTotal,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
