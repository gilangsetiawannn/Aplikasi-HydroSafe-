import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key); // Tambahkan parameter key

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false;
  final _emailController = TextEditingController(); // Controller for Email
  final _passwordController = TextEditingController(); // Controller for Password
  String? _errorMessage; // Variable for error message

  bool _isPasswordValid(String password) {
    // Password validation logic
    if (password.length < 8) return false;

    bool hasUpperCase = password.contains(RegExp(r'[A-Z]'));
    bool hasLowerCase = password.contains(RegExp(r'[a-z]'));
    bool hasSpecialCharacter = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

    return hasUpperCase && hasLowerCase && hasSpecialCharacter;
  }

  void _login() {
    final String email = _emailController.text;
    final String password = _passwordController.text;

    // Simulasi login
    if (email.isEmpty || password.isEmpty) {
      setState(() {
        _errorMessage = 'Email dan Password tidak boleh kosong';
      });
      return; // Keluar dari fungsi jika ada error
    }

    // Validasi password
    if (_isPasswordValid(password)) {
      final name = email.split('@').first; // Mengambil nama dari email

      Navigator.pushReplacementNamed(
        context,
        '/home',
        arguments: {'name': name}, // Pass name to HomeScreen
      );
    } else {
      setState(() {
        _errorMessage = 'Gunakan password sebanyak 8 digit dan variasikan simbol, huruf besar, dan huruf kecil';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      resizeToAvoidBottomInset: true, // Mengatasi overflow saat keyboard muncul
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Halo Hydrofans,',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 8),
            Text(
              'selamat datang di aplikasi HydroSafe. Untuk login, segera lengkapi data di bawah ini.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 24),
            TextField(
              controller: _emailController, // Attach controller to TextField
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email, color: Colors.blue),
                border: OutlineInputBorder(),
                errorText: _errorMessage, // Menampilkan pesan kesalahan jika ada
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController, // Attach controller for Password
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock, color: Colors.blue),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
                border: OutlineInputBorder(),
                errorText: _errorMessage, // Menampilkan pesan kesalahan jika ada
              ),
            ),
            SizedBox(height: 8), // Mengurangi jarak di sini
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/forgot-password');
                },
                child: Text('Lupa Password?'),
              ),
            ),
            SizedBox(height: 16), // Mengurangi jarak di sini
            Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: _login, // Memanggil fungsi login saat tombol ditekan
                    child: Text('Login'),
                  ),
                  SizedBox(height: 8), // Jarak antara tombol login dan pendaftaran
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/register'); // Navigasi ke halaman Register
                    },
                    child: Text('Belum punya akun? Daftar di sini'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
