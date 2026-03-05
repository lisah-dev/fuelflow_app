import 'package:flutter/material.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/register_screen.dart';
import 'screens/auth/password_reset_screen.dart';
import 'screens/company_admin/stations_screen.dart';
import 'screens/home_layout.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pamtech App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/reset-password': (context) => const PasswordResetScreen(),
        '/home': (context) => const CompanyAdminHome(),
        '/stations': (context) => const StationsScreen(),
      },
    );
  }
}
