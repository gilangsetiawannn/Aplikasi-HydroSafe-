import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  final Function(String, String, String, String) onRegister;

  const RegisterScreen({Key? key, required this.onRegister}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  String? _errorMessage;

  bool _isPasswordValid(String password) {
    if (password.length < 8) return false;
    bool hasUpperCase = password.contains(RegExp(r'[A-Z]'));
    bool hasLowerCase = password.contains(RegExp(r'[a-z]'));
    bool hasSpecialCharacter = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    return hasUpperCase && hasLowerCase && hasSpecialCharacter;
  }

  void _register() {
    final username = _usernameController.text;
    final email = _emailController.text;
    final phoneNumber = _phoneController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (password != confirmPassword) {
      setState(() {
        _errorMessage = 'Password dan Konfirmasi Password tidak cocok.';
      });
      return;
    }

    if (!_isPasswordValid(password)) {
      setState(() {
        _errorMessage = 'Gunakan password sebanyak 8 digit dan variasikan simbol, huruf besar, dan huruf kecil';
      });
      return;
    }

    widget.onRegister(username, email, phoneNumber, password);

    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Registrasi Akun',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person, color: Colors.blue), // Ikon untuk username dengan warna biru
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email, color: Colors.blue), // Ikon untuk email dengan warna biru
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Nomor Telepon',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.phone, color: Colors.blue), // Ikon untuk nomor telepon dengan warna biru
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock, color: Colors.blue), // Ikon untuk password dengan warna biru
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Konfirmasi Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock_outline, color: Colors.blue), // Ikon untuk konfirmasi password dengan warna biru
              ),
            ),
            if (_errorMessage != null) ...[
              SizedBox(height: 8),
              Text(
                _errorMessage!,
                style: TextStyle(color: Colors.red, fontSize: 12),
              ),
            ],
            SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: _register,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text('Daftar', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
