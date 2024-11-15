import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  final Function(String name, String address, String quantity, String phone, DateTime selectedDate, String price) onOrderPlaced;

  OrderScreen({required this.onOrderPlaced});

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  String? selectedQuantity;
  String? selectedPrice;
  DateTime? selectedDate;

  final Map<String, String> priceMap = {
    '1000 Liter': '150.000,00',
    '1200 Liter': '200.000,00',
    '1300 Liter': '250.000,00',
  };

  int _selectedIndex = 1; // Untuk menandakan posisi Order di BottomNavigationBar

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        // Halaman order, tidak perlu melakukan apa-apa
        break;
      case 2:
        Navigator.pushNamed(context, '/payment');
        break;
      case 3:
        Navigator.pushNamed(context, '/order-history');
        break;
      case 4:
        Navigator.pushNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesan Air Bersih', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Nama',
                prefixIcon: Icon(Icons.person, color: Colors.blue),
              ),
            ),
            TextField(
              controller: addressController,
              decoration: InputDecoration(
                labelText: 'Alamat',
                prefixIcon: Icon(Icons.location_on, color: Colors.blue),
              ),
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: 'Nomor Telepon',
                prefixIcon: Icon(Icons.phone, color: Colors.blue),
              ),
              keyboardType: TextInputType.phone,
            ),
            DropdownButtonFormField<String>(
              value: selectedQuantity,
              items: priceMap.keys.map((quantity) => DropdownMenuItem(
                value: quantity,
                child: Text(quantity),
              )).toList(),
              onChanged: (value) {
                setState(() {
                  selectedQuantity = value;
                  selectedPrice = priceMap[value!];
                });
              },
              decoration: InputDecoration(
                labelText: 'Jumlah Air',
                prefixIcon: Icon(Icons.water, color: Colors.blue),
              ),
            ),
            SizedBox(height: 16),
            if (selectedPrice != null)
              Text('Harga: Rp $selectedPrice', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(DateTime.now().year + 2),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          selectedDate = pickedDate;
                        });
                      }
                    },
                    child: Text(selectedDate == null
                        ? 'Pilih Tanggal'
                        : 'Tanggal: ${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end, // Mengatur agar tombol "Pesan" berada di sebelah kanan
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (nameController.text.isEmpty ||
                        addressController.text.isEmpty ||
                        phoneController.text.isEmpty ||
                        selectedQuantity == null ||
                        selectedDate == null) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Kesalahan'),
                            content: Text('Isi informasi dengan benar.'),
                            actions: [
                              TextButton(
                                child: Text('OK'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                      return;
                    }

                    widget.onOrderPlaced(
                      nameController.text,
                      addressController.text,
                      selectedQuantity!,
                      phoneController.text,
                      selectedDate!,
                      selectedPrice!,
                    );

                    Navigator.pushNamed(context, '/payment', arguments: {
                      'name': nameController.text,
                      'address': addressController.text,
                      'phone': phoneController.text,
                      'quantity': selectedQuantity!,
                      'orderDate': selectedDate!,
                      'price': selectedPrice!,
                    });
                  },
                  child: Text('Pesan'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Order'),
          BottomNavigationBarItem(icon: Icon(Icons.payment), label: 'Payment'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Order History'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: const Color.fromARGB(255, 59, 117, 211),
        onTap: _onItemTapped,
      ),
    );
  }
}
