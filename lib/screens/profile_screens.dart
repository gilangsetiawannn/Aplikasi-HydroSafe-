import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  final Map<String, String> userProfile;

  const ProfileScreen({Key? key, required this.userProfile}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late String userName;
  late String email;
  late String phoneNumber;

  late TextEditingController _userNameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneNumberController;

  @override
  void initState() {
    super.initState();
    userName = widget.userProfile['username'] ?? '';
    email = widget.userProfile['email'] ?? '';
    phoneNumber = widget.userProfile['phoneNumber'] ?? '';

    _userNameController = TextEditingController(text: userName);
    _emailController = TextEditingController(text: email);
    _phoneNumberController = TextEditingController(text: phoneNumber);
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  void _editProfile() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _userNameController,
                  decoration: InputDecoration(
                    labelText: 'Nama Pengguna',
                  ),
                ),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                TextField(
                  controller: _phoneNumberController,
                  decoration: InputDecoration(
                    labelText: 'Nomor Telepon',
                  ),
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      userName = _userNameController.text;
                      email = _emailController.text;
                      phoneNumber = _phoneNumberController.text;
                    });
                    Navigator.pop(context); // Tutup modal
                  },
                  child: Text('Simpan'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _logout() {
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Pengguna', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: _editProfile, // Ketika teks ditekan, buka modal edit
              child: Text(
                'Edit Profile >',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.person, color: Colors.blue),
              title: Text('Nama Pengguna'),
              subtitle: Text(userName),
            ),
            ListTile(
              leading: Icon(Icons.email, color: Colors.blue),
              title: Text('Email'),
              subtitle: Text(email),
            ),
            ListTile(
              leading: Icon(Icons.phone, color: Colors.blue),
              title: Text('Nomor Telepon'),
              subtitle: Text(phoneNumber),
            ),
            Spacer(), // Untuk memisahkan konten dengan tombol logout
            ElevatedButton(
              onPressed: _logout,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Warna tombol logout
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100), // Padding tombol
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // Membuat tombol melengkung
                ),
              ),
              child: Text(
                'Logout',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 20), // Jarak bawah
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            label: 'Payment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Order History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 4, // Index untuk menunjukkan item yang dipilih (Profile)
        selectedItemColor: Colors.blue,
        unselectedItemColor: const Color.fromARGB(255, 59, 117, 211),
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
              Navigator.pushNamed(context, '/order');
              break;
            case 2:
              Navigator.pushNamed(context, '/payment');
              break;
            case 3:
              Navigator.pushNamed(context, '/order-history');
              break;
            case 4:
              // Halaman profile, tidak perlu melakukan apa-apa
              break;
          }
        },
      ),
    );
  }
}
