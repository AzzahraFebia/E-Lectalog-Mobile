import 'package:flutter/material.dart';
import 'pages/login_page.dart'; // Import halaman login yang baru dibuat

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Lectalog App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2563EB)),
        useMaterial3: true,
      ),
      // Mengarahkan halaman awal pertama kali aplikasi dibuka ke LoginPage
      home: const LoginPage(),
    );
  }
}