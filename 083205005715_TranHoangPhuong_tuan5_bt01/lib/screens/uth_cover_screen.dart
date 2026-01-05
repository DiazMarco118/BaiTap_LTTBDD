import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'onboarding_screen.dart';

class UTHCoverScreen extends StatefulWidget {
  const UTHCoverScreen({super.key});

  @override
  State<UTHCoverScreen> createState() => _UTHCoverScreenState();
}

class _UTHCoverScreenState extends State<UTHCoverScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToOnboarding();
  }

  void _navigateToOnboarding() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const OnboardingScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/uth.png', width: 250, height: 100),
              Text(
                'UTH SmartTasks',
                style: GoogleFonts.righteous(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF0066FF),
                  letterSpacing: 0.5,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
