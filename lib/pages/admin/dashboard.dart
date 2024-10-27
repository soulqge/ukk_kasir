import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ukk_kasir/data/model_data.dart';
import 'package:ukk_kasir/pages/admin/edit_menu.dart';
import 'package:ukk_kasir/pages/kasir/checklist.dart';
import 'dart:convert';

import 'package:ukk_kasir/pages/login/loginpage.dart';

class AdminDashboard extends StatefulWidget {
  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  String? accessToken;
  List<dynamic> users = []; // To store user data
  final List<OrderItem> _orderList = [];

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding
        .ensureInitialized(); // Ensure Flutter binding is initialized
    _loadAccessToken();
  }

  // Load access token from SharedPreferences
  Future<void> _loadAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      accessToken = prefs.getString('access_token');
      _fetchUsers(); // Fetch users after loading the access token
    });
  }

  // Fetch users from the API
  Future<void> _fetchUsers() async {
    if (accessToken == null) return;

    final response = await http.get(
      Uri.parse(
          'https://ukkcafe.smktelkom-mlg.sch.id/api/user'), // Replace with your API endpoint
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      setState(() {
        users = jsonDecode(
            response.body); // Assuming the response is a list of users
      });
    } else {
      // Handle error
      print('Failed to load users: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 235,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/welcome.png'),
                colorFilter: ColorFilter.linearToSrgbGamma(),
                fit: BoxFit.cover, // Makes the image cover the whole screen
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                // Top bar with clock and logout icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Welcome!',
                      style: GoogleFonts.inter(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _showLogoutDialog(
                            context); // Calls the logout dialog function
                      },
                      child: Icon(Icons.logout, size: 30, color: Colors.white),
                    ),
                  ],
                ),
                // Subtext with name
                Text(
                  'Manager - Arif.',
                  style: GoogleFonts.inter(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      // Takes remaining space before the image
                      CategorySection(
                        title: 'Makanan',
                        items: culinaryItems,
                        onItemAdded: (item, quantity, desc) {
                          _addItemToOrder(item, quantity, desc);
                        },
                        onItemDesc: (item, desc) {
                          _addItemDescription(item, desc);
                        },
                      ),
                      CategorySection(
                        title: 'Minuman',
                        items: drinkItems,
                        onItemAdded: (item, quantity, desc) {
                          _addItemToOrder(item, quantity, desc);
                        },
                        onItemDesc: (item, desc) {
                          _addItemDescription(item, desc);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // Show logout dialog
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _logout(); // Call logout function
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Logout'),
            ),
          ],
        );
      },
    );
  }

  // Logout function
  void _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('access_token');
    await prefs.remove('user_role');
    await prefs.remove('user_id');
    // Navigate to login page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
    );
  }

  // Edit user function (placeholder)
  void _editUser(int userId) {
    // Navigate to edit user page or show a dialog
    print('Edit user with ID: $userId');
  }

  // Fungsi untuk menambahkan item ke daftar pesanan
  void _addItemToOrder(MenuItem item, int quantity, String desc) {
    setState(() {
      _orderList
          .add(OrderItem(item: item, quantity: quantity, description: desc));
    });
  }

  // Fungsi untuk menambahkan deskripsi ke item
  void _addItemDescription(MenuItem item, String desc) {
    setState(() {
      int index = _orderList.indexWhere((order) => order.item == item);
      if (index != -1) {
        _orderList[index] = OrderItem(
            item: item,
            quantity: _orderList[index].quantity,
            description: desc);
      }
    });
  }
}

class CategorySection extends StatelessWidget {
  final String title;
  final List<MenuItem> items;
  final Function(MenuItem, int, String) onItemAdded;
  final Function(MenuItem, String) onItemDesc;

  CategorySection({
    required this.title,
    required this.items,
    required this.onItemAdded,
    required this.onItemDesc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              const Icon(Icons.expand_more),
              const SizedBox(width: 8),
              Text(
                title,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          child: Container(
            height: 150, // Tinggi container
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                MenuItem selectedItem = items[index];
                return GestureDetector(
                  onTap: () {
                    // Menampilkan ItemPopup saat item di-klik
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MenuUI()),
                    );
                  },
                  child: Container(
                    width: 130,
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12)),
                          child: Image.asset(
                            selectedItem.imageUrl,
                            fit: BoxFit.cover,
                            height: 80, // Tinggi gambar
                            width: double.infinity,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            selectedItem.name,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'IDR ${selectedItem.price}',
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey[600]),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
