import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonCheckout extends StatelessWidget {
  final String title;
  final VoidCallback onPressed; // Add onPressed as a parameter

  const ButtonCheckout({
    super.key,
    required this.title,
    required this.onPressed, // Make onPressed required
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          side: BorderSide(color: Colors.black),
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
        ),
        onPressed: onPressed, // Use the onPressed callback
        child: Text(
          title,
          style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
