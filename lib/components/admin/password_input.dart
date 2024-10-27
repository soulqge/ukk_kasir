import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({super.key});

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {

  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Password",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 5),
                  TextField(
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintStyle: GoogleFonts.inter(
                        fontSize: 16,
                        color: Color.fromRGBO(143, 143, 143, 1)
                      ),
                      hintText: '8-12 Character',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObscure ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
  }
}