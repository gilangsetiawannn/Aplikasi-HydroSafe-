import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController verificationCodeController = TextEditingController();

  bool _isVerificationVisible = false;

  void _requestPasswordReset() {
    setState(() {
      _isVerificationVisible = true; // Tampilkan bagian verifikasi
    });
  }

  void _updatePassword() {
    // Logika untuk memperbarui password
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lupa Password', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Reset Password',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.blue),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Text(
              'Masukkan email Anda untuk mengirimkan kode verifikasi.',
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email, color: Colors.blue),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.blue[50],
              ),
            ),
            SizedBox(height: 16),
            if (_isVerificationVisible) ...[
              TextField(
                controller: newPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password Baru',
                  prefixIcon: Icon(Icons.lock, color: Colors.blue),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.blue[50],
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: verificationCodeController,
                decoration: InputDecoration(
                  labelText: 'Kode Verifikasi (5 digit)',
                  prefixIcon: Icon(Icons.security, color: Colors.blue),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.blue[50],
                ),
                keyboardType: TextInputType.number,
                maxLength: 5,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _updatePassword,
                child: Text('Perbarui Password'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              ),
            ],
            SizedBox(height: 16),
            if (!_isVerificationVisible) 
              ElevatedButton(
                onPressed: _requestPasswordReset,
                child: Text('Kirim Kode Verifikasi'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              ),
          ],
        ),
      ),
    );
  }
}
