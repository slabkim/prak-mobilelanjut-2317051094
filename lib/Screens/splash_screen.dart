import 'dart:async';
import 'package:flutter/material.dart';
import 'dashboard_screen.dart'; 
import 'login_screen.dart'; 

class SplashScreen extends StatefulWidget {
  static const String route = '/splash';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToDashboard();
  }
  void _navigateToDashboard(){
    Future.delayed(const Duration(seconds: 5), (){
      Navigator.pushReplacementNamed(context, DashboardScreen.route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8FB),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/JustduitLogo.png', width: 200, height: 200),
            const SizedBox(height: 24),
            const CircularProgressIndicator(
              color: Color(0xFF1E88FF),
            ),
            const SizedBox(height: 16),
            Text(
              'Justduit',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}