import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.blue, // Latar belakang biru untuk seluruh halaman
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    width: 150, 
                    height: 150,
                  ),
                  SizedBox(height: 10), 
                  Text(
                    'HydroSafe',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, 
                    ),
                  ),
                  SizedBox(height: 20), // Memberi jarak antara logo dan tombol
                  ElevatedButton(
                    onPressed: () {
                      // Navigasi ke halaman login saat tombol ditekan
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // Warna latar belakang tombol
                      foregroundColor: Colors.blue, // Warna teks tombol
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12), // Padding tombol
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30), // Border radius untuk tombol
                      ),
                    ),
                    child: Text(
                      'Get Started',
                      style: TextStyle(fontSize: 16), // Ukuran font
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
