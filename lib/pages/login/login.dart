import 'package:flutter/material.dart';
import 'package:ukk_kasir/pages/login/loginpage.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 92, 91, 91),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Placeholder for the coffee shop image
          Container(
            height: 280.0,
            width: 280.0,
            child: Image.asset(
              'assets/images/shop.png', // Add your image asset here
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 20),
          // Title Text
          Text(
            'Wikusama Cafe',
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          SizedBox(height: 40),
          // Log In Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text('Login', style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
