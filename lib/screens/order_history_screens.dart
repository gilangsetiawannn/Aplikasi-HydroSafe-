import 'package:flutter/material.dart';

class OrderHistoryScreen extends StatefulWidget {
  final List<Map<String, dynamic>> orderHistory; // Ubah di sini

  OrderHistoryScreen({required this.orderHistory});

  @override
  _OrderHistoryScreenState createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  late List<Map<String, dynamic>> updatedOrderHistory; // Ubah di sini

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
                        Text('Harga: ${order['price'] ?? ''}'), // Tampilkan harga
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
                          updatedOrderHistory[index]['status'] = value!; // Ubah status di sini
                        });
                      },
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/home');
        },
        child: Icon(Icons.home),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
