import 'package:flutter/material.dart';

class OrderHistoryScreen extends StatefulWidget {
  final List<Map<String, dynamic>> orderHistory;

  OrderHistoryScreen({required this.orderHistory});

  @override
  _OrderHistoryScreenState createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  late List<Map<String, dynamic>> updatedOrderHistory;

  @override
  void initState() {
    super.initState();
    updatedOrderHistory = List.from(widget.orderHistory);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Pemesanan'),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: updatedOrderHistory.isEmpty
          ? Center(
              child: Text(
                'Belum ada riwayat pemesanan.',
                style: TextStyle(color: Colors.blueGrey),
              ),
            )
          : ListView.builder(
              itemCount: updatedOrderHistory.length,
              itemBuilder: (context, index) {
                final order = updatedOrderHistory[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text('Nama: ${order['name'] ?? ''}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Alamat: ${order['address'] ?? ''}'),
                        Text('Jumlah: ${order['quantity'] ?? ''}'),
                        Text('Harga: ${order['price'] ?? ''}'),
                        Text('Status: ${order['status'] ?? 'Belum Dikirim'}'),
                      ],
                    ),
                    trailing: DropdownButton<String>(
                      value: order['status'] ?? 'Belum Dikirim',
                      items: [
                        DropdownMenuItem(
                          value: 'Belum Dikirim',
                          child: Text('Belum Dikirim'),
                        ),
                        DropdownMenuItem(
                          value: 'Pesanan Selesai',
                          child: Text('Pesanan Selesai'),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          updatedOrderHistory[index]['status'] = value!;
                        });
                      },
                    ),
                  ),
                );
              },
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
        currentIndex: 3, // Indeks untuk menunjukkan item yang dipilih
        selectedItemColor: Colors.blue[800], // Warna biru tua saat dipilih
        unselectedItemColor: Colors.blue[300], // Warna biru muda saat tidak dipilih
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
              Navigator.pushNamed(context, '/order'); // Ganti dengan rute yang sesuai
              break;
            case 2:
              Navigator.pushNamed(context, '/payment'); // Ganti dengan rute yang sesuai
              break;
            case 3:
              // Halaman ini, tidak perlu melakukan apa-apa
              break;
            case 4:
              Navigator.pushNamed(context, '/profile'); // Ganti dengan rute yang sesuai
              break;
          }
        },
      ),
      // Menghapus FloatingActionButton
    );
  }
}
