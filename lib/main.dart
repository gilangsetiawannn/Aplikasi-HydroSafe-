import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/login_screens.dart';
import 'screens/home_screens.dart';
import 'screens/order_screens.dart';
import 'screens/profile_screens.dart';
import 'screens/order_history_screens.dart';
import 'screens/forgot_password_screens.dart';
import 'screens/payment_screens.dart';

void main() => runApp(WaterFlowApp());

class WaterFlowApp extends StatefulWidget {
  @override
  _WaterFlowAppState createState() => _WaterFlowAppState();
}

class _WaterFlowAppState extends State<WaterFlowApp> {
  List<Map<String, dynamic>> _orderHistory = []; 

  void _addOrder(String name, String address, String quantity, String phone, DateTime selectedDate, String price) {
    setState(() {
      _orderHistory.add({
        'name': name,
        'address': address,
        'quantity': quantity,
        'phone': phone,
        'date': selectedDate,
        'price': price,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WaterFlow',
      theme: ThemeData(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/welcome', 
      routes: {
        '/welcome': (context) => WelcomeScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/order': (context) => OrderScreen(onOrderPlaced: _addOrder),
        '/profile': (context) => ProfileScreen(),
        '/order-history': (context) => OrderHistoryScreen(orderHistory: _orderHistory),
        '/forgot-password': (context) => ForgotPasswordScreen(),
        '/payment': (context) {
          final args = ModalRoute.of(context)!.settings.arguments;

          // Pastikan args adalah Map dan quantity ada
          if (args is Map<String, dynamic>) {
            return PaymentScreen(
              name: args['name'] ?? '', 
              address: args['address'] ?? '',
              phone: args['phone'] ?? '',
              quantity: args['quantity'] ?? '', // Periksa apakah quantity diterima
              orderDate: args['orderDate'] ?? DateTime.now(),
            );
          } else {
            return PaymentScreen(
              name: '', 
              address: '',
              phone: '',
              quantity: '',
              orderDate: DateTime.now(),
            );
          }
        },
      },
    );
  }
}