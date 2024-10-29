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
                    width: 150, // Ukuran logo
                    height: 150,
                  ),
                  SizedBox(height: 10), // Jarak sedikit lebih kecil antara logo dan teks
                  Text(
                    'HydroSafe',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Warna teks putih
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: TextButton(
              onPressed: () {
                // Navigasi ke halaman login saat tombol skip ditekan
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: Text(
                'Skip',
                style: TextStyle(color: Colors.white, fontSize: 16), // Warna teks putih dan ukuran font
              ),
            ),
          ),
        ],
      ),
    );
  }
}
