// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:waterflow/main.dart'; // Pastikan ini adalah jalur yang benar ke file utama Anda

void main() {
  testWidgets('WaterFlow app smoke test', (WidgetTester tester) async {
    // Membangun aplikasi dan memicu frame
    await tester.pumpWidget(WaterFlowApp()); // Ganti MyApp dengan WaterFlow

    // Verifikasi elemen awal pada tampilan
    expect(find.byType(ElevatedButton), findsOneWidget); // Contoh memeriksa tombol
    expect(find.text('Login'), findsOneWidget); // Contoh memeriksa teks yang diharapkan
  });
}
