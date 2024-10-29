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
    // Logika untuk meminta reset password (misalnya, kirim email)
    setState(() {
      _isVerificationVisible = true; // Tampilkan bagian verifikasi
    });
  }

  void _updatePassword() {
    // Logika untuk memperbarui password (misalnya, kirim request ke server)
    // Setelah berhasil, navigasi kembali ke halaman login
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
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email Baru',
                prefixIcon: Icon(Icons.email, color: Colors.blue),
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
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: verificationCodeController,
                      decoration: InputDecoration(
                        labelText: 'Kode Verifikasi (5 digit)',
                      ),
                      keyboardType: TextInputType.number,
                      maxLength: 5,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _updatePassword,
                child: Text('Update Password'),
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
