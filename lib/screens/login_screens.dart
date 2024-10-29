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
              'Selamat Datang',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 8),
            Text(
              'Halo, selamat datang di aplikasi HydroSafe. Untuk login, segera lengkapi data di bawah ini.',
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
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Extract name from email before '@'
                      final email = _emailController.text;
                      final password = _passwordController.text;

                      // Validate password
                      if (_isPasswordValid(password)) {
                        final name = email.split('@').first;

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
                    },
                    child: Text('Login'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/forgot-password');
                    },
                    child: Text('Lupa Password?'),
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
