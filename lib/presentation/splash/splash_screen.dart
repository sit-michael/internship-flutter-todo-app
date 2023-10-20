import 'dart:async';

import 'package:flutter/material.dart';
import '../../domain/bloc_exports.dart';
import '../main/tabs_screen.dart';

class SplashScreen extends StatefulWidget {
  static const id = '/';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void onNextPage() {
    Timer(const Duration(milliseconds: 2000), () {
      Navigator.of(context).pushReplacementNamed(TabsScreen.id);
    });
  }

  @override
  void initState() {
    onNextPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
