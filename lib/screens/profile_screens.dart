import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userName = 'Gilang Setiawan';
  String address = 'Balikpapan Utara';
  String phoneNumber = '082153105814';
  int _currentIndex = 4; // Set initial index to profile
  String profileImageUrl = 'https://via.placeholder.com/150'; // Ganti dengan URL gambar profil Anda

  void _showEditProfileDialog() {
    final TextEditingController nameController = TextEditingController(text: userName);
    final TextEditingController addressController = TextEditingController(text: address);
    final TextEditingController phoneController = TextEditingController(text: phoneNumber);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Profil'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Nama'),
              ),
              TextField(
                controller: addressController,
                decoration: InputDecoration(labelText: 'Alamat'),
              ),
              TextField(
                controller: phoneController,
                decoration: InputDecoration(labelText: 'Nomor Telepon'),
                keyboardType: TextInputType.phone,
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Simpan'),
              onPressed: () {
                setState(() {
                  userName = nameController.text;
                  address = addressController.text;
                  phoneNumber = phoneController.text;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/order');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/payment');
        break; 
      case 3:
        Navigator.pushReplacementNamed(context, '/order-history');
        break;
      case 4:
        // No action needed since we are already on Profile
        break;
    }
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
              backgroundImage: NetworkImage(profileImageUrl),
              child: IconButton(
                icon: Icon(Icons.camera_alt, color: Colors.white),
                onPressed: () {
                  // Tambahkan fungsi untuk mengganti gambar di sini
                },
              ),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.person, color: Colors.blue),
              title: Text('Nama Pengguna'),
              subtitle: Text(userName),
              trailing: IconButton(
                icon: Icon(Icons.edit, color: Colors.blue),
                onPressed: _showEditProfileDialog,
              ),
            ),
            ListTile(
              leading: Icon(Icons.location_on, color: Colors.blue),
              title: Text('Alamat'),
              subtitle: Text(address),
            ),
            ListTile(
              leading: Icon(Icons.phone, color: Colors.blue),
              title: Text('Nomor Telepon'),
              subtitle: Text(phoneNumber),
            ),
            SizedBox(height: 20),
            ListTile(
              title: Text('Logout', style: TextStyle(color: Colors.red)),
              leading: Icon(Icons.logout, color: Colors.red),
              onTap: _logout,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
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
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
