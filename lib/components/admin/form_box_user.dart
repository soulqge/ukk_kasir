import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormBoxUser extends StatelessWidget {

  final String label;
  final String hint;

  const FormBoxUser({super.key, required this.label, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    label,
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 5),
                  TextField(
                    decoration: InputDecoration(
                      hintStyle: GoogleFonts.inter(
                        fontSize: 16,
                        color: Color.fromRGBO(143, 143, 143, 1)
                      ),
                      hintText: hint,
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            );
  }
}