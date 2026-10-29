import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Pastikan ini sesuai dengan nama project kamu saat di-create
import 'package:quiz_mobile/main.dart'; 

void main() {
  testWidgets('App UI load smoke test', (WidgetTester tester) async {
    // Build aplikasi kita
    await tester.pumpWidget(const MyApp());

    // Verifikasi bahwa aplikasi berhasil jalan dengan mencari teks di AppBar
    expect(find.text('Logo Apps'), findsOneWidget);
  });
}