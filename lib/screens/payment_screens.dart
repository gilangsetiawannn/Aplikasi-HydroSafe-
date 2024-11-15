import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  final String name;
  final String address;
  final String phone;
  final String quantity; 
  final DateTime orderDate; 

  // Constructor to receive order data
  PaymentScreen({
    required this.name,
    required this.address,
    required this.phone,
    required this.quantity,
    required this.orderDate,
  });

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final TextEditingController accountNumberController = TextEditingController();

  String selectedBank = 'Pilih Bank'; // Default selection for bank
  String selectedPaymentMethod = 'Transfer Bank'; // Default payment method

  final List<String> banks = [
    'Pilih Bank',
    'Bank BCA',
    'Bank Mandiri',
    'Bank BRI',
    'Bank BNI',
    'Bank Danamon',
  ];

  bool _isPaymentSuccessful = false; // Track payment status
  String? _invoiceDetails; // Store invoice details

  // Custom function to format date as dd-MM-yyyy
  String formatDate(DateTime date) {
    return "${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year}";
  }

  void _processPayment() {
    // Cek nilai quantity dari widget dan pastikan bisa dikonversi ke int
    print('Quantity yang diterima: ${widget.quantity}');

    // Menghapus bagian " Liter" jika ada
    String cleanedQuantity = widget.quantity.replaceAll(' Liter', '');
    int quantity = int.tryParse(cleanedQuantity) ?? 0;

    // Jika quantity tetap 0 setelah parsing, itu berarti data yang diteruskan salah
    if (quantity == 0 && cleanedQuantity.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Jumlah air tidak valid! Harap periksa input.')),
      );
      return;
    }

    // Melanjutkan ke proses pembayaran
    if (selectedPaymentMethod == 'Transfer Bank') {
      String accountNumber = accountNumberController.text;

      if (selectedBank != 'Pilih Bank' && accountNumber.isNotEmpty) {
        setState(() {
          _isPaymentSuccessful = true;
          _invoiceDetails = "Invoice\n"
                            "----------------------------------\n"
                            "Metode Pembayaran: Transfer Bank\n"
                            "Bank: $selectedBank\n"
                            "Nomor Rekening: $accountNumber\n"
                            "Nama: ${widget.name}\n"
                            "Alamat: ${widget.address}\n"
                            "No Telepon: ${widget.phone}\n"
                            "Jumlah Air: $quantity L\n"
                            "Tanggal Pemesanan: ${formatDate(widget.orderDate)}\n"
                            "Status: Pembayaran Berhasil\n"
                            "----------------------------------";
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Pembayaran berhasil dilakukan!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Harap lengkapi semua data!')),
        );
      }
    } else if (selectedPaymentMethod == 'Cash on Delivery') {
      setState(() {
        _isPaymentSuccessful = true;
        _invoiceDetails = "Invoice\n"
                          "----------------------------------\n"
                          "Metode Pembayaran: Cash on Delivery\n"
                          "Nama: ${widget.name}\n"
                          "Alamat: ${widget.address}\n"
                          "No Telepon: ${widget.phone}\n"
                          "Jumlah Air: $quantity L\n"
                          "Tanggal Pemesanan: ${formatDate(widget.orderDate)}\n"
                          "Status: Pembayaran akan dilakukan di lokasi pengiriman.\n"
                          "Silakan siapkan uang tunai sejumlah total pembelian.\n"
                          "----------------------------------";
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Pembayaran COD berhasil disetujui!')),
      );
    }
  }

  void _backToHome() {
    Navigator.pushReplacementNamed(context, '/home');
  }

  void _onNavigationTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        Navigator.pushNamed(context, '/order');
        break;
      case 2:
        // Halaman Payment, tidak perlu melakukan apa-apa
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
        title: Text('Payment'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: _isPaymentSuccessful ? _buildInvoice() : _buildPaymentOptions(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Order'),
          BottomNavigationBarItem(icon: Icon(Icons.payment), label: 'Payment'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Order History'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: 2, // Menunjukkan bahwa Payment adalah tab yang aktif
        selectedItemColor: Colors.blue[800],
        unselectedItemColor: Colors.blue[300],
        onTap: _onNavigationTapped,
      ),
    );
  }

  Widget _buildPaymentOptions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _paymentMethodButton('Transfer Bank'),
              _paymentMethodButton('Cash on Delivery'),
            ],
          ),
          SizedBox(height: 16),
          if (selectedPaymentMethod == 'Transfer Bank') _buildBankTransferForm(),
          if (selectedPaymentMethod == 'Cash on Delivery') _buildCashOnDeliveryInfo(),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: _processPayment,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: Size(120, 40), // Set a minimum size for consistency
                ),
                child: Text('Bayar'),
              ),
              ElevatedButton(
                onPressed: _backToHome,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: Size(120, 40), // Set a minimum size for consistency
                ),
                child: Text('Home'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _paymentMethodButton(String method) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPaymentMethod = method;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: selectedPaymentMethod == method ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          method,
          style: TextStyle(
            color: selectedPaymentMethod == method ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildBankTransferForm() {
    return Column(
      children: [
        DropdownButton<String>(
          value: selectedBank,
          isExpanded: true,
          items: banks.map((String bank) {
            return DropdownMenuItem<String>(
              value: bank,
              child: Text(bank),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedBank = newValue!;
            });
          },
        ),
        SizedBox(height: 16),
        TextField(
          controller: accountNumberController,
          decoration: InputDecoration(
            labelText: 'Masukkan Nomor Rekening',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }

  Widget _buildCashOnDeliveryInfo() {
    return Column(
      children: [
        Text(
          'Pembayaran akan dilakukan di lokasi pengiriman. Silakan siapkan uang tunai.',
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16),
        Icon(
          Icons.delivery_dining,
          size: 50,
          color: Colors.blue,
        ),
      ],
    );
  }

  Widget _buildInvoice() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Pembayaran Berhasil!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Text(
            _invoiceDetails ?? '',
            style: TextStyle(fontSize: 14), // Make text smaller
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 32),
          ElevatedButton(
            onPressed: _backToHome,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
            child: Text('Kembali ke Home'),
          ),
        ],
      ),
    );
  }
}
